class CreatePaypalAdaptivePayments < ActiveRecord::Migration
  def change
    create_table :paypal_adaptive_payments do |t|
      t.string :paypal_payment_id
      t.string :paypal_payer_id
      t.string :paypal_token
      t.integer :transaction_id
      t.integer :community_id

      t.timestamps null: false
    end
  end
end
