# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Cloudspokes::Application.initialize!

ENV['sfdc_username'] = 'mess@cloudspokes.com.dev091'
ENV['sfdc_password'] = '74H3yd2NZW'


ActionMailer::Base.smtp_settings = {
  :enable_starttls_auto => true,
  :port           => '25',
  :address        => 'smtp.sendgrid.net',
  :authentication => :plain,
  :user_name      => "app1527003@heroku.com",
  :password       => "bmx6eot3",
  :domain         => 'heroku.com'
}
ActionMailer::Base.delivery_method = :smtp

