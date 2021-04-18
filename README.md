Making an airline booker, to consolidate the material I've been learning on advanced form (ie nesting forms and what have you).

1. Enter desired dates / airports and click “Search”
2. Choose from among a list of eligible flights
3. Enter passenger information for all passengers
4. Enter billing information


# Major Hiccups:

Email: Well firstly Sendgrid continualy blocked all the apps I tried to link to it, instantly..
Then mailgun requires your own Domain from what I can tell, so i decided to just screw it and buy a domain with amazon. But since I was doing all that, I found the AWS SES. So then I tried using this. 5 hours of torment later with the 'missing credentials' error, whenever i tried sending an email through the heroku app, i figured out FINALLY that my environment variables were somehow blank.. even those i exported them to my heroku environment/config.. (still don't get that). I then tried like 4 different ways of setting them. 1. Making an intialiser, 2. Making an 'estabilish connection' method to aws server in the lib/aws/s3/connetion, 3. Doing these fancy things in the application.rb file. 4. THE WORKING SOLOUTION -> installing the dotenv gem and simply adding the credentials needed (aws key and secret blah blah) to the .env file.

That's another thing that was confusing me the whole time though, on the aws site it says for SES sdk you need to be using a smtp username and password, but it ended up working when i set the aws keys and what not, the smtp stuff didn't seem to matter. LORDY...



<a href='https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-on-rails/lessons/building-advanced-forms'>Link to odin project page</a>


# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


