class Order < ApplicationRecord
	belongs_to :user
	before_create :user_check, :status_fill

  after_create :broadcast_to_admins
  after_update :broadcast_to_admins, :broadcast_to_delivery_man

	def user_check
		Order.all.each do |order|
			if self.phone.last(11) == order.phone.last(11)
				self.existing = "Returning"
			else
				self.existing = "New"
			end
		end
	end

	def status_fill
		self.status = "Pending"
	end

  def broadcast_to_admins
    admin_users = User.where(admin: true, order_connection_status: 1)
    admin_users.each do |user|
      ActionCable.server.broadcast "order_channel_#{user.id}", order: self.as_json
      sleep 1
    end
  end

  def broadcast_to_delivery_man
    if User.where(id: self.user_id, order_connection_status: 1).present?
      ActionCable.server.broadcast "order_channel_#{self.user_id}", order: self.as_json
    end
  end

end