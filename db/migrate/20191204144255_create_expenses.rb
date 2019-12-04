class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
    	t.string :purpose
    	t.string :user
    	t.integer :amount
		t.timestamps
    end
  end
end