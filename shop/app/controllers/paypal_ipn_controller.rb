class PaypalIpnController < ApplicationController

  include PaypalService::MerchantInjector
  include PaypalService::IPNInjector

  skip_before_filter :verify_authenticity_token, :fetch_logged_in_user, :fetch_community, :fetch_community_membership, :check_http_auth

  IPNDataTypes = PaypalService::DataTypes::IPN

  def ipn_hook
    logger = PaypalService::Logger.new
    api = paypal_merchant.build_api(nil)

    if api.ipn_valid?(request.raw_post)  # return true if PP backend verifies the msg
      ipn_service.store_and_create_handler(params)
    else
      logger.warn("Fake IPN message received: #{request.raw_post}")
    end

    # We received the message ok, so send back 200 OK with empty body
    render nothing: true
  end

# The paid method will check to make sure the transaction is complete.
  def paid
    payKey = params[:payKey]
    @api = PayPal::SDK::AdaptivePayments.new
    @payment_details = @api.build_payment_details({
     :payKey => payKey
      })
    paypal_status = { :completed => "COMPLETED", :incomplete => "INCOMPLETE", :pending => "PENDING", :processing => "PROCESSING" }
    @payment_details_response = @api.payment_details(@payment_details)
    if @payment_details_response.status == paypal_status[:incomplete] || @payment_details_response.status == paypal_status[:pending] || @payment_details_response.status == paypal_status[:processing]
        @execute_payment = @api.build_execute_payment({
          :payKey => payKey
          })
        @execute_payment_response = @api.execute_payment(@execute_payment)
        @payment_details = @api.build_payment_details({
          :payKey => payKey
          })
        @payment_details_response = @api.payment_details(@payment_details)
        payment = PaypalAdaptivePayment.where(paypal_payment_id: payKey).first
        transaction = Transaction.where(id: payment.transaction_id).first
        id = transaction.listing_id
        @listing = Listing.where(id: id).first
        MarketplaceService::Transaction::Command.transition_to(payment.transaction_id, "paid")
        render text: 'Transaction not yet complete', content_type: 'text/plain'
    elsif @payment_details_response.status == paypal_status[:completed]
      payment = PaypalAdaptivePayment.where(paypal_payment_id: payKey).first
      transaction = Transaction.where(id: payment.transaction_id).first
      id = transaction.listing_id
      @listing = Listing.where(id: id).first
      # @listing.update_attribute(:open, false)
      MarketplaceService::Transaction::Command.transition_to(payment.transaction_id, "paid")
      render text: 'Transaction completed', content_type: 'text/plain'
    else
      render text: 'Transaction other', content_type: 'text/plain'
    end
  end


end
