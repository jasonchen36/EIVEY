class PaymentNotificationsController < ApplicationController
=begin
    include PaypalService::MerchantInjector
    include PaypalService::IPNInjector
=end
    skip_before_filter :verify_authenticity_token, :fetch_logged_in_user, :fetch_community, :fetch_community_membership, :check_http_auth
=begin
    IPNDataTypes = PaypalService::DataTypes::IPN
=end
    def ipn_hook
      puts "!!!!!!!!"
      puts request.raw_post
=begin
      logger = PaypalService::Logger.new

      api = paypal_merchant.build_api(nil)

      if api.ipn_valid?(request.raw_post)  # return true if PP backend verifies the msg
        ipn_service.store_and_create_handler(params)
      else
        logger.warn("Fake IPN message received: #{request.raw_post}")
      end
=end
      # We received the message ok, so send back 200 OK with empty body
      render nothing: true
    end
end
