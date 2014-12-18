# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!
#config.action_mailer.delivery_method = :smtp
Depot::Application.configure do
	config.action_mailer.default_url_options = { host: 'localhost:3000' }
  config.action_mailer.delivery_method = :smtp
 
  config.action_mailer.perform_deliveries = true
  config.action_mailer.smtp_settings = {
    address: "smtp.gmail.com",
    port: 587,
    domain: "gmail.com",
    authentication: "plain",
    user_name: 'ganeshbangar18',
    password: '31081992ganu',
    enable_starttls_auto: true
  }
end