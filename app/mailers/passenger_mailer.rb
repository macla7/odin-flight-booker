class PassengerMailer < ApplicationMailer
  #default to: -> { params[:passengers_attributes]['0']['email'] }

  def thank_you(passenger = nil)
    if passenger.nil?
      @booker = params[:booking]['passengers_attributes']['0']
      @flight_id = params[:booking]['flight_id']
    else
      @booker = passenger
      @flight_id = passenger.booking.flight_id
    end
    puts 'ME TOOOO'
    puts params
    puts @flight_id
    puts @booker
    puts 'Can you see MEEEEEE'
    mail(to: @booker['email'], subject: 'Thanks for Booking with Fly High!')
  end
end
