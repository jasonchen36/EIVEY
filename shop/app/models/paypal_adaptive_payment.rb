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

class PaypalAdaptivePayment < ActiveRecord::Base
  attr_accessible(
  :community_id,
  :transaction_id,
  :paypal_payer_id,
  :paypal_token,
  :paypal_payment_id
)

validates_presence_of(
  :community_id,
  :transaction_id,
  :paypal_payment_id
 )

belongs_to :transactions

end
