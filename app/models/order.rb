class Order < ApplicationRecord
	belongs_to :user
	before_create :user_check, :status_fill

  after_create :brodcast_to_ongoing
  after_update :brodcast_to_ongoing, :broadcast_to_delivery_man

  attribute :delivery_man_notified, default: false

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
