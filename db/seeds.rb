# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

flightstart = Time.now
flightend = Time.new(2021, 5, 1) + 1.days
flightstart2 = Time.now + 2.days - 5.hours
flightend2 = Time.new(2021, 5, 1) + 4.days - 5.hours
flightstart3 = Time.now + 2.days
flightend3 = Time.new(2021, 5, 1) + 4.days


@airport = Airport.create([{airport_code: 'NYC'}, {airport_code: 'SFO'}, {airport_code: 'MEL'}])
# NOTE: Need to also create the validations by essentially making them in the same way as attributes!
@flight = Flight.create([
  {start_time: flightstart, duration: flightend, from_airport: Airport.find_by(airport_code: 'MEL'), to_airport: Airport.find_by(airport_code: 'NYC')},
  {start_time: flightstart2, duration: flightend2, from_airport: Airport.find_by(airport_code: 'SFO'), to_airport: Airport.find_by(airport_code: 'MEL')},
  {start_time: flightstart3, duration: flightend3, from_airport: Airport.find_by(airport_code: 'SFO'), to_airport: Airport.find_by(airport_code: 'MEL')}
  ])