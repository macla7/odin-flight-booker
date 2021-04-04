class Airport < ApplicationRecord
  has_many :departing_flights, class_name: 'Flight', inverse_of: 'from_airport', foreign_key: 'start_code', primary_key: 'airport_code'
  has_many :arriving_flights, class_name: 'Flight', inverse_of: 'to_airport', foreign_key: 'end_code', primary_key: 'airport_code'
end
