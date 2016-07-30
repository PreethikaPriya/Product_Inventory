class CreateLitems < ActiveRecord::Migration
  def change
    create_table :litems do |t|
    	t.date :order_date
    	t.string :order_number
      t.timestamps null: false
    end
  end
end
