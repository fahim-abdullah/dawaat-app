class PromoCode < ApplicationRecord
  validates :name, :promo_type, :discount_value, :minimum_amount, :expiration_date, presence: true

  enum promo_type: { flat_discount: 0, percentage_discount: 1 }

  def self.calculate(promo_code_name:, subtotal:)
    promo_code = PromoCode.find_by_name(promo_code_name)
    error_messages = []

    error_messages << 'Please input promo code' if promo_code_name.empty?
    error_messages << 'Promo code not found' if promo_code.nil?
    error_messages << 'Promo code expired' if promo_code.present? && promo_code.expiration_date < Time.now

    if promo_code.present? && subtotal < promo_code.minimum_amount
      # error_messages << "Minimum order amount for this promo code is #{@promo_code.minimum_amount} TK"
      error_messages << "Please order minimum #{promo_code.minimum_amount} TK to use this promo code"
    end

    discount = 0
    total = subtotal

    if error_messages.empty?
      if promo_code.flat_discount?
        discount = promo_code.discount_value
      elsif promo_code.percentage_discount?
        discount = subtotal * (promo_code.discount_value / 100.0)
      end    
    end

    total = subtotal - discount

    return promo_code, error_messages, discount, total
  end
end
