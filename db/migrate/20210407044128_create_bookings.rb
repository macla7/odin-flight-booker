class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.string :name
      t.integer :flight_id

      t.timestamps
    end
    add_index :bookings, :flight_id
  end
end
