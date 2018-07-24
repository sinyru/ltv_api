class CreateSampleOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :sample_orders do |t|

      t.string :order_unique_key, null: false, unique: true
      t.integer :order_id, null: false, unique: true, limit: 8
      t.integer :customer_id, null: false, limit: 8
      t.date :created_at, null: false
      t.string :item_purchased, null: false
      t.string :email, null: false
      t.string :first_name
      t.string :last_name
      t.integer :quantity
      t.float :price
      t.string :item_description

      t.timestamps
    end
  end
end
