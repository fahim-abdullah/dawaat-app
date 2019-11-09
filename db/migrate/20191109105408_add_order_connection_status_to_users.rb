class AddOrderConnectionStatusToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :order_connection_status, :integer
  end
end
