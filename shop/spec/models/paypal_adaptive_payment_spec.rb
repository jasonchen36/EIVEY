# == Schema Information
#
# Table name: paypal_adaptive_payments
#
#  id                :integer          not null, primary key
#  paypal_payment_id :string(255)
#  paypal_payer_id   :string(255)
#  paypal_token      :string(255)
#  transaction_id    :integer
#  community_id      :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'rails_helper'

RSpec.describe PaypalAdaptivePayment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
