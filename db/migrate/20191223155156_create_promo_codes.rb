class CreatePromoCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :promo_codes do |t|
      t.string :name
      t.integer :promo_type
      t.integer :discount_value
      t.integer :minimum_amount
      t.datetime :expiration_date

      t.timestamps
    end
  end
end
