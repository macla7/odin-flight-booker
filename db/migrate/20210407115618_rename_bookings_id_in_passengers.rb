class RenameBookingsIdInPassengers < ActiveRecord::Migration[6.1]
  def change
    rename_column :passengers, :bookings_id, :booking_id
  end
end
