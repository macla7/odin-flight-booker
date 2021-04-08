class Flight < ApplicationRecord
  belongs_to :from_airport, class_name: 'Airport', foreign_key: 'start_code', primary_key: 'airport_code'
  belongs_to :to_airport, class_name: 'Airport', foreign_key: 'end_code', primary_key: 'airport_code'
  has_many :bookings

  def start_time_formatted
    start_time.strftime("%m/%d/%Y")
  end

end
