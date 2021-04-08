class AddPassengerIdToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :passenger_id, :integer
    remove_column :bookings, :name, :string
    add_index :bookings, :passenger_id
  end
  
end
