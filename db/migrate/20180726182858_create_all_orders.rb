class CreateAllOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :all_orders do |t|
      t.string :order_unique_key, null: false, unique: true
      t.integer :order_id, limit: 8
      t.integer :customer_id, limit: 8
      t.date :created_at
      t.string :item_purchased
      t.string :email
      t.string :first_name
      t.string :last_name
      t.integer :quantity
      t.float :price
      t.string :item_description
      t.timestamps
    end
  end
end
