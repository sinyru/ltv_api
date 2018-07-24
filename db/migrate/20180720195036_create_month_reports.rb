class CreateMonthReports < ActiveRecord::Migration[5.0]
  def change
    create_table :month_reports do |t|

      t.integer :order_counts, null: false
      t.integer :sample_counts, null: false
      t.integer :six_counts, null: false
      t.integer :twelve_counts, null: false
      t.integer :twenty_four_counts, null: false
      t.integer :subscriber_counts, null: false
      t.string :date_range, null: false

      t.timestamps
    end
  end
end
