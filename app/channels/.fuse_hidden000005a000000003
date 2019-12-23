class OrderChannel < ApplicationCable::Channel
  def subscribed
    if params[:page] == 'ongoing'
      stream_from "order_channel_point_#{params[:delivery_point_id]}"
    elsif params[:page] == 'myorders'
      stream_from "order_channel_user_#{current_user.id}"
      current_user.set_order_connection_status(online: 1)
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed

    current_user.set_order_connection_status(online: 0)
  end

  def receive(data)
    puts "-- OrderChannel: receive -- #{data.inspect}"
  end
end


=begin

# Order model

class Order < ApplicationRecord
  after_create :broadcast_to_admins
  after_update :broadcast_to_delivery_man

  def broadcast_to_admins
    admin_users = User.where(admin: true)
    admin_users.each do |user|
      wait 1 second
      ActionCable.server.broadcast "order_channel_#{current_user.id}", order: self.as_json
    end
  end

  def broadcast_to_delivery_man
    delvery_man_id = self.user_id
    ActionCable.server.broadcast "order_channel_#{delvery_man_id}", order: self.as_json
  end
end


# -------------- client side -----------------------

receive(data)

var order_id = data['order']['id']

var order_row = $('#order-row-' + order_id)

if(order_row.length == 0) {
  insert row
} else {
  update row
}

=end


