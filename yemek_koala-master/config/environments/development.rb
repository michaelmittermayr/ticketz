YemekKoala::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the webserver when you make code changes.
  config.cache_classes = false
  config.eager_load = false
  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  #config.action_view.debug_rjs             = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  #config.action_mailer.raise_delivery_errors = false

  config.logger = Logger.new(STDOUT)

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  config.action_mailer.default_url_options = { :host => 'http://ticketz-ticketz.44fs.preview.openshiftapps.com' }
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  ActionMailer::Base.delivery_method = :smtp

  config.action_mailer.smtp_settings = {
    :user_name => ENV["SENDGRID_USERNAME"],
    :password => ENV["SENDGRID_PASSWORD"],
  #  :domain => 'openshiftapps.com',
    :address              => 'smtp.sendgrid.net',
     :port                 => 587,
     :authentication       => :plain,
     :enable_starttls_auto => true  }

end

