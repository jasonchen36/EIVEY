# == Schema Information
#
# Table name: braintree_accounts
#
#  id                     :integer          not null, primary key
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string(255)
#  last_name              :string(255)
#  person_id              :string(255)
#  email                  :string(255)
#  phone                  :string(255)
#  address_street_address :string(255)
#  address_postal_code    :string(255)
#  address_locality       :string(255)
#  address_region         :string(255)
#  date_of_birth          :date
#  routing_number         :string(255)
#  hidden_account_number  :string(255)
#  status                 :string(255)
#  community_id           :integer
#

class BraintreeAccount < ActiveRecord::Base

  # TODO Rails 4, Remove
  include ActiveModel::ForbiddenAttributesProtection


  belongs_to :person
  belongs_to :community

  validates_presence_of :person
  validates_presence_of :email
  validates_format_of   :email, :with => /\A[A-Z0-9._%\-\+\~\/]+@([A-Z0-9-]+\.)+[A-Z]+\z/i
  end
