class CreateUpdateDates < ActiveRecord::Migration[5.0]
  def change
    create_table :update_dates do |t|

      t.string :start_date, null: false
      t.string :end_date, null: false

      t.timestamps
    end
  end
end
