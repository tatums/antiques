PhoebeboothanitquesCom2::Application.configure do

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

  MAIL = YAML.load_file("#{Rails.root}/config/mail.yml")

  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :domain               => MAIL[Rails.env]["domain"],
    :user_name            => MAIL[Rails.env]["user_name"],
    :password             => MAIL[Rails.env]["password"],
    :authentication       => 'plain',
    :enable_starttls_auto => true  }


  # See everything in the log (default is :info)
   config.log_level = :debug

  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners
  config.active_support.deprecation = :notify
end
