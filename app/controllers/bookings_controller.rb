class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    params[:passengers].to_i.times { @booking.passengers.build }
    @flights = Flight.all
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save!
      flash[:notice] = "Made a new booking for #{params[:booking]['passengers_attributes']['0']['name']}'s Group!"
      redirect_to "/bookings/#{@booking.id}"
    else
      flash.now[:error] = "Shiiit"
    end
  end

  def show
  end

  private
  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
  end
end
