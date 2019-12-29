class AddPromoCodeToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :promo_name, :string
    add_column :orders, :promo_type, :integer
    add_column :orders, :promo_discount_value, :integer, default: 0
    add_column :orders, :discount, :integer, default: 0
    add_column :orders, :total, :integer
  end
end
