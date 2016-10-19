require 'rubygems'
require 'json'

class PaymentsNotificationsController < ApplicationController

=begin
    include PaypalService::MerchantInjector
    include PaypalService::IPNInjector
=end
    #skip_before_filter :verify_authenticity_token, :fetch_logged_in_user, :fetch_community, :fetch_community_membership, :check_http_auth
=begin
    IPNDataTypes = PaypalService::DataTypes::IPN
=end
    #def ipn_hook
      #puts "!!!!!!!!"
      #puts request.raw_post
      #puts JSON.parse(request.raw_post)["pay_key"]
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
      #render nothing: true
    #end
    protect_from_forgery :except => [:ipn_hook] #Otherwise the request from PayPal wouldn't make it to the controller
    def ipn_hook
      puts "IPN HOOK"
      response = validate_IPN_notification(request.raw_post)
      case response
      when "VERIFIED"
        # check that paymentStatus=Completed
        # check that txnId has not been previously processed
        # check that receiverEmail is your Primary PayPal email
        # check that paymentAmount/paymentCurrency are correct
        # process payment
        puts "IPN VERIFIED"
      when "INVALID"
        puts "IPN INVALID"
      else
        # error
        puts "IPN ERROR"
      end
      render :nothing => true
    end
    protected
    def validate_IPN_notification(raw)
      uri = URI.parse('https://www.paypal.com/cgi-bin/webscr?cmd=_notify-validate')
      http = Net::HTTP.new(uri.host, uri.port)
      http.open_timeout = 60
      http.read_timeout = 60
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      http.use_ssl = true
      response = http.post(uri.request_uri, raw,
                           'Content-Length' => "#{raw.size}",
                           'User-Agent' => "My custom user agent"
                         ).body
    end
end
