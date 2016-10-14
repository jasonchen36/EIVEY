#PayPal::SDK.load("config/paypal.yml", Rails.env)
#PayPal::SDK.logger = Rails.logger

PAYPAL_CONFIG = YAML.load_file("#{Rails.root}/config/paypal_payments.yml")[Rails.env]
