class BraintreeAccountsController < ApplicationController

  LIST_OF_STATES = [
      ['Alberta', 'AB'],
      ['British Columbia', 'BC'],
      ['Manitoba', 'MB'],
      ['New Brunswick', 'NB'],
      ['Newfoundland and Labrador', 'NL'],
      ['Nova Scotia', 'NS'],
      ['Ontario', 'ON'],
      ['Prince Edward Island', 'PE'],
      ['Quebec', 'QC'],
      ['Saskathewan', 'SK']
    ]

  before_filter do |controller|
    controller.ensure_logged_in t("layouts.notifications.you_must_log_in_to_change_payment_settings")
  end

  # Commonly used paths
  before_filter do |controller|
    @create_path = create_braintree_settings_payment_path(@current_user)
    @show_path = show_braintree_settings_payment_path(@current_user)
    @new_path = new_braintree_settings_payment_path(@current_user)
  end

  # New/create
  before_filter :ensure_user_does_not_have_account, :only => [:new, :create]

  before_filter :ensure_user_does_not_have_account_for_another_community

  def new
    redirect_to action: :show and return if @current_user.braintree_account

    @list_of_states = LIST_OF_STATES
    @braintree_account = create_new_account_object
    render locals: { form_action: @create_path }
  end

  def show
    redirect_to action: :new and return unless @current_user.braintree_account

    @list_of_states = LIST_OF_STATES
    @braintree_account = BraintreeAccount.find_by_person_id(@current_user.id)
    @state_name, _ = LIST_OF_STATES.find do |state|
      name, code = state
      code == @braintree_account.address_region
    end

    render locals: { form_action: @create_path }
  end

  def create
    @list_of_states = LIST_OF_STATES
    braintree_params = params.require(:braintree_account).permit(
      :person_id,
      :email
    )

    model_attributes = braintree_params
      .merge(person: @current_user)
      .merge(community_id: @current_community.id)

    @braintree_account = BraintreeAccount.new(model_attributes)
    if @braintree_account.valid?
      # Save Braintree account before calling the Braintree API
      # Braintree may trigger the webhook very, very fast (at least in sandbox)
      # and saving account to DB now ensures that the webhook finds the account
      @paypal_api = PayPal::SDK::AdaptiveAccounts.new
    # puts @paypal_api.methods 
      # Build request object
      @get_verified_status = @paypal_api.build_get_verified_status({
        :emailAddress => model_attributes[:email],
        :matchCriteria => "NONE" })
      
      # Make API call & get response
      @get_verified_status_response = @paypal_api.get_verified_status(@get_verified_status)
      
      # Access Response
      if @get_verified_status_response.success?
        puts "successful validation! Real Email!"
        @braintree_account.save! 
      else
        puts "failed validation!"
        puts @get_verified_status_response.response_status
        flash[:error] = "Sorry, but your email failed validation with paypal. Please check that the email is attached to a valid paypal account."
       # @braintree_account.errors.full_messages
        render :new, locals: { form_action: @create_path } and return
      end
#      @braintree_account.save!
      #TODO: check with paypal it's an actual paypal account
    else
      flash[:error] = @braintree_account.errors.full_messages
      render :new, locals: { form_action: @create_path } and return
    end

    #TODO: check paypal for success
    #success = if merchant_account_result.success?
    success = if true
      BTLog.info("Successfully created Paypal account for person id #{@current_user.id}")
    #  update_status!(@braintree_account, merchant_account_result.merchant_account.status)
    else
      BTLog.error("Failed to created Paypal account for person id #{@current_user.id}: unkown reason")

      error_string = "Your Paypal payout details could not be saved, because of following errors: unknown "
   #   merchant_account_result.errors.each do |e|
    #    error_string << e.message + " "
     # end
      flash[:error] = error_string

      @braintree_account.destroy

      false
    end

    if success
      flash[:notice] = t("layouts.notifications.payment_details_add_successful")
      redirect_to @show_path
    else
      flash[:error] ||= t("layouts.notifications.payment_details_add_error")
      render :new, locals: { form_action: @create_path }
    end
  end

  private


  # Before filter
  def ensure_user_does_not_have_account
    braintree_account = BraintreeAccount.find_by_person_id(@current_user.id)

    unless braintree_account.blank?
      flash[:error] = "Cannot create a new Paypal account. You already have one"
      redirect_to @show_path
    end
  end

  # Before filter
  # Support for multiple Braintree account in multipe communities
  # is not implemented. Show error.
  def ensure_user_does_not_have_account_for_another_community
    @braintree_account = BraintreeAccount.find_by_person_id(@current_user.id)

    if @braintree_account
      # Braintree account exists
      if @braintree_account.community_id.present? && @braintree_account.community_id != @current_community.id
        # ...but is associated to different community
        account_community = Community.find(@braintree_account.community_id)
        flash[:error] = "You have payment account for community #{account_community.name(I18n.locale)}. Unfortunately, you cannot have payment accounts for multiple communities. You are unable to receive money from transactions in community #{@current_community.name(I18n.locale)}. Please contact administrators."

        error_msg = "User #{@current_user.id} tried to create a Braintree payment account for community #{@current_community.name(I18n.locale)} even though she has existing account for #{account_community.name(I18n.locale)}"
        BTLog.error(error_msg)
        ApplicationHelper.send_error_notification(error_msg, "BraintreePaymentAccountError")
        redirect_to person_settings_path(@current_user)
      end
    end
  end

  # Give `braintree_account` and `new_status` candidate. Update the status, unless the status is already
  # active
  #
  # Background: If the webhook has already update the status to "active", we don't want to change it back
  # to pending. This may happen in sandbox environment, where the webhook is triggered very fast
  def update_status!(braintree_account, new_status)
    braintree_account.reload
    braintree_account.status = new_status if braintree_account.status != "active"
    braintree_account.save!
  end

  def create_new_account_object
    person = @current_user
    person_details = {
      first_name: person.given_name,
      last_name: person.family_name,
      email: person.confirmed_notification_email_to, # Our best guess for "primary" email
      phone: person.phone_number
    }

    BraintreeAccount.new(person_details)
  end
end
