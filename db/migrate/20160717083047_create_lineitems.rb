class CreateLineitems < ActiveRecord::Migration
  def change
    create_table :lineitems do |t|
    	t.integer :order_id
    	t.integer :product_id
    	t.integer :quantity
    	t.float :price
    	t.float :total_price
      t.timestamps null: false
    end
  end
end
