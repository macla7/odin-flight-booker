class ChangeBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :passengers, :bookings_id, :integer
    remove_column :bookings, :passenger_id, :integer
    add_index :passengers, :bookings_id
  end
end
