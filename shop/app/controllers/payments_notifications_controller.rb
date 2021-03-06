require 'rubygems'
require 'json'
require 'paypal-sdk-adaptivepayments'

class PaymentsNotificationsController < ApplicationController

    skip_before_filter :verify_authenticity_token, :fetch_logged_in_user, :fetch_community, :fetch_community_membership, :check_http_auth
  def ipn_hook
    @api = PayPal::SDK::AdaptivePayments.new

    if @api.ipn_valid?(request.raw_post)  # return true if PP backend verifies the msg
      logger.debug 'ipn valid'
      logger.debug params 
      payKey = params[:pay_key]
      check_if_paid(payKey)
    else
      logger.debug 'bad request'
      logger.warn("Fake IPN message received: #{request.raw_post}")
    end

    # We received the message ok, so send back 200 OK with empty body
    render nothing: true
  end

  # The paid method will check to make sure the transaction is complete.
  def check_if_paid (payKey)
    @api = PayPal::SDK::AdaptivePayments.new
    @payment_details = @api.build_payment_details({
     :payKey => payKey
      })
    paypal_status = { :completed => "COMPLETED", :incomplete => "INCOMPLETE", :pending => "PENDING", :processing => "PROCESSING" }
    @payment_details_response = @api.payment_details(@payment_details)
    if @payment_details_response.status == paypal_status[:pending] || @payment_details_response.status == paypal_status[:processing]
      logger.debug 'Transaction Not yet completed, waiting on IPN:'+@payment_details_response.status 
      render "transactions/thank-you"
    elsif @payment_details_response.status == paypal_status[:completed] || @payment_details_response.status == paypal_status[:incomplete]

      payment = PaypalAdaptivePayment.where(paypal_payment_id: payKey).first
      transaction = Transaction.where(id: payment.transaction_id).first
      id = transaction.listing_id
      @listing = Listing.where(id: id).first
      @listing.update_attribute(:open, false)
      MarketplaceService::Transaction::Command.transition_to(payment.transaction_id, "paid")

      # Move conversations for transaction into messages
       Delayed::Job.enqueue(MessageSentJob.new(transaction.conversation.messages.last.id, @current_community.id))

      logger.debug 'Transaction Completed:'+@payment_details_response.status 
      render "transactions/thank-you"
    else
      logger.debug 'Unknown Transaction type:'+@payment_details_response.status 
      render "transactions/thank-you"
    end
  end
end
