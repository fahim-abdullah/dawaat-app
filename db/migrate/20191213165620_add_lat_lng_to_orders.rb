class AddLatLngToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :lat, :decimal, precision: 30, scale: 25
    add_column :orders, :lng, :decimal, precision: 30, scale: 25
  end
end
