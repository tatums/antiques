PhoebeBoothAntiquesCom::Application.configure do

  config.cache_classes = true

  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  config.serve_static_assets = false

  # Compress JavaScripts and CSS
  config.assets.compress = true

  # Don't fallback to assets pipeline if a precompiled asset is missed

  #config.assets.compile = false
  config.assets.compile = true

  # Generate digests for assets URLs
  config.assets.digest = true


  #CACHE added on 2/4/2012
  config.cache_store = :dalli_store

  #The Mail.yml file is not in the git repo. --so the username and pass are in the env
  #heroku config:add MAIL_DOMAIN=phoebeboothantiquest.com
  #
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :domain               => ENV['MAIL_DOMAIN'],
    :user_name            => ENV['MAIL_USERNAME'],
    :password             => ENV['MAIL_PASSWORD'],
    :authentication       => 'plain',
    :enable_starttls_auto => true  }


  # See everything in the log (default is :info)
   config.log_level = :debug

  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners
  config.active_support.deprecation = :notify
end
