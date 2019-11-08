class Order < ApplicationRecord
	belongs_to :user
	before_create :user_check, :status_fill

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

end