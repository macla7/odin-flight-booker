class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map do |a|
      if Airport.find(a.id).departing_flights != []
        [a.airport_code, a.airport_code]
      end
    end
    @passengers_options = [['1', 1], ['2', 2], ['3', 3], ['4',4]]
    @flights = Flight.all
    @flight_options = Flight.all.map {|f| [f.start_time_formatted, f.start_time]}
  end

  def show
  end

  def edit
  end
  
  def create
    @flight = Flight.new(flight_params)
  end

  def update
  end

  def destroy
    @flight.destroy
  end

  private

  def set_flight
    @flight = Flight.find(params[:id])
  end

  def flight_params
    params.require(:flight).permit(:start_code, :end_code, :start_time, :duration)
  end


end
