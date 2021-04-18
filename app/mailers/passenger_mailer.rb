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
    puts params[:booking]['passengers_attributes']
        # # mail(to: @booker['email'], subject: 'Thanks for Booking with Fly High!')
    sender = "hello@shiftmarket.com.au"
    params[:booking]['passengers_attributes'].each do |key, value|
      puts key
      puts value
      recipient = value['email'].to_s
      awsregion = "ap-southeast-2"
      subject = "#{value['name'].to_s}'s Flight Details"
      htmlbody =
      '<h1>Flight Booked!</h1>'\
      "<p>Hi #{value['name'].to_s}! We're looking forward to flying together! "\
      'See our flights search page <a href="http://www.shiftmarket.com.au">'\
      'here</a>.'
      textbody = "This email was sent with Amazon SES using the AWS SDK for Ruby."
      encoding = "UTF-8"
      ses = Aws::SES::Client.new(
        region: awsregion,
        credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY'])
        )
      begin
      
        # Provide the contents of the email.
        resp = ses.send_email({
          destination: {
            to_addresses: [
              recipient,
            ],
          },
          message: {
            body: {
              html: {
                charset: encoding,
                data: htmlbody,
              },
              text: {
                charset: encoding,
                data: textbody,
              },
            },
            subject: {
              charset: encoding,
              data: subject,
            },
          },
        source: sender,
        # Comment or remove the following line if you are not using 
        # a configuration set
        # configuration_set_name: configsetname,
        })
        puts "Email sent!"
      
        # If something goes wrong, display an error message.
      rescue Aws::SES::Errors::ServiceError => error
        puts "Email not sent. Error message: #{error}"
      end
    end
  end
end
