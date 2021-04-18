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
    # # mail(to: @booker['email'], subject: 'Thanks for Booking with Fly High!')
    sender = "mitchclarkmapie@hotmail.com"
    recipient = "MitchelClark1997@outlook.com"
    awsregion = "ap-southeast-2"
    subject = "You've Booked a Flight!"
    htmlbody =
    '<h1>Booked!</h1>'\
    '<p>This email was sent with <a href="https://aws.amazon.com/ses/">'\
    'Amazon SES</a> using the <a href="https://aws.amazon.com/sdk-for-ruby/">'\
    'AWS SDK for Ruby</a>.'
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
