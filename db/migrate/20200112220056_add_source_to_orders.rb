class AddSourceToOrders < ActiveRecord::Migration[5.2]
  def change
  	add_column :orders, :source, :string
  end
end
