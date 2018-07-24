class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|

      t.integer :customer_id, null: false, unique: true, limit: 8
      t.string :email, null: false, unique: true
      t.string :first_name
      t.string :last_name
      t.string :province
      t.string :country
      t.date :created_at
      t.date :updated_at
      t.boolean :status, null: false, :default => false

      t.timestamps
    end
  end
end
