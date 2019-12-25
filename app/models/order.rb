class Order < ApplicationRecord
	belongs_to :user
	before_create :user_check, :status_fill

  after_create :brodcast_to_ongoing
  after_update :brodcast_to_ongoing, :broadcast_to_delivery_man

  enum promo_type: { flat_discount: 0, percentage_discount: 1 }

  has_many :order_items

  belongs_to :delivery_point

	def user_check
		Order.all.each do |order|
			if self.phone.last(11) == order.phone.last(11)
				self.existing = "Returning"
			else
				self.existing = "New"
			end
		end
  rescue => e
    Rails.logger.error "Exception in app/models/order.rb: user_check callback, order_id: #{self.id}"
    Rails.logger.error e.message
	end

  def apply_promo_code(promo_code_name:, subtotal_amount:)
    promo_hash = { promo_code_name: promo_code_name, subtotal: subtotal_amount }
    promo_code, error_message_arr, discount_amount, total_amount = PromoCode.calculate(promo_hash)

    if error_message_arr.empty?
      self.subtotal = subtotal_amount
      self.promo_name = promo_code_name
      self.promo_type = promo_code.promo_type
      self.promo_discount_value = promo_code.discount_value
      self.discount = discount_amount
      self.total = total_amount
      self.save(validate: false)
    end
  end

	def status_fill
		self.status = "Pending"
	end

  def brodcast_to_ongoing
    ActionCable.server.broadcast "order_channel_point_#{self.delivery_point_id}", order: self.as_json
  rescue => e
    Rails.logger.error "Exception in app/models/order.rb: brodcast_to_ongoing callback, order_id: #{self.id}"
    Rails.logger.error e.message
  end

  def broadcast_to_delivery_man
    ActionCable.server.broadcast "order_channel_user_#{self.user_id}", order: self.as_json
  rescue => e
    Rails.logger.error "Exception in app/models/order.rb: broadcast_to_delivery_man callback, order_id: #{self.id}"
    Rails.logger.error e.message
  end
end
