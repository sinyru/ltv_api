class CreateRdates < ActiveRecord::Migration[5.0]
  def change
    create_table :rdates do |t|

      t.string :start_date, null: false

      t.timestamps
    end
  end
end
