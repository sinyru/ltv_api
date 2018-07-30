class CreateAllOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :all_orders do |t|
      t.string :order_unique_key, null: false, unique: true
      t.integer :order_id, limit: 8
      t.integer :customer_id, limit: 8
      t.date :created_at
      t.string :variant_title
      t.string :email
      t.string :first_name
      t.string :last_name
      t.integer :quantity
      t.float :price
      t.string :product_title
      t.string :item_type
      t.boolean :s_24, :default => false
      t.boolean :s_12, :default => false
      t.boolean :s_6, :default => false
      t.boolean :s_sub, :default => false
      t.boolean :prod_sub, :default => false

      t.timestamps
    end
  end
end
