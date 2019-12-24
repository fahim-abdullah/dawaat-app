class PromoCode < ApplicationRecord
  validates :name, :promo_type, :discount_value, :minimum_amount, :expiration_date, presence: true

  enum promo_type: { flat_discount: 0, percentage_discount: 1 }
end
