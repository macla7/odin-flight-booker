class CreateFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|
      t.string :start_code
      t.string :end_code
      t.datetime :start_time
      t.time :duration

      t.timestamps
    end
    add_index :flights, :start_code
    add_index :flights, :end_code
  end
end
