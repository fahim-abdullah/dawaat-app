class DeliveryPoint < ApplicationRecord
  has_many :products
  has_many :orders
  has_many :expenses
  belongs_to :manager, class_name: 'User', optional: true
end
