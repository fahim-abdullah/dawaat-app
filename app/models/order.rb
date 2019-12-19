class Order < ApplicationRecord
	belongs_to :user
	before_create :user_check, :status_fill

  after_create :broadcast_to_admins
  after_update :broadcast_to_admins, :broadcast_to_delivery_man

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

  def broadcast_to_admins
    admin_users = User.where(admin: true, order_connection_status: 1)
    admin_users.each do |user|
      ActionCable.server.broadcast "order_channel_#{user.id}", order: self.as_json
      self.delivery_man_notified = true if user.id == self.user_id
      sleep 1
    end
  rescue => e
    Rails.logger.error "Exception in app/models/order.rb: broadcast_to_admins callback, order_id: #{self.id}"
    Rails.logger.error e.message
  end

  def broadcast_to_delivery_man
    if self.delivery_man_notified
      puts '-- delivery_man_notified --'
      return
    end

    if User.where(id: self.user_id, order_connection_status: 1).present?
      ActionCable.server.broadcast "order_channel_#{self.user_id}", order: self.as_json
    end
  rescue => e
    Rails.logger.error "Exception in app/models/order.rb: broadcast_to_delivery_man callback, order_id: #{self.id}"
    Rails.logger.error e.message
  end

end
