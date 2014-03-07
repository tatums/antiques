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

  config.after_initialize do
    CarrierWave.configure do |config|
      config.storage :fog
      config.fog_credentials = {
       provider: "AWS",
       aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
       aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
      }
      config.fog_directory = ENV['S3_BUCKET_NAME']
    end
  end

end
