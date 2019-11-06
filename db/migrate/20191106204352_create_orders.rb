class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
    	t.string :fullname
    	t.string :phone
    	t.string :address
    	t.string :flathouse
    	t.string :road

			# Hidden
    	t.string :latlng
    	t.string :subtotal
    	t.string :itemquantity

			# In Model
    	t.string :existing
    	t.string :status
    	t.timestamp :ontheway_time
    	t.timestamp :delivery_time

    	t.timestamps
    end
  end
end