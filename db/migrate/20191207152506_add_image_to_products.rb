class AddImageToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :available_image, :string
    add_column :products, :soldout_image, :string
    add_column :products, :sequence, :integer
  end
end
