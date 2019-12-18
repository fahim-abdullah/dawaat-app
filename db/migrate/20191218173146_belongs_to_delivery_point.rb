class BelongsToDeliveryPoint < ActiveRecord::Migration[5.2]
  def change
    add_column :delivery_points, :manager_id, :integer
    add_column :products, :delivery_point_id, :integer
    add_column :orders, :delivery_point_id, :integer
    add_column :expenses, :delivery_point_id, :integer
  end
end
