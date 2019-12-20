class ChangePriceStringToInteger < ActiveRecord::Migration[5.2]
  def up
    change_column :orders, :subtotal, :integer
    change_column :products, :old_price, :integer
    change_column :products, :price, :integer
  end

  def down
    change_column :orders, :subtotal, :string
    change_column :products, :old_price, :string
    change_column :products, :price, :string
  end
end
