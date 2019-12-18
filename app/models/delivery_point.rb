class DeliveryPoint < ApplicationRecord
  has_many :products
  has_many :orders
  has_many :expenses
end
