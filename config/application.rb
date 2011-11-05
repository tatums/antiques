require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require *Rails.groups(:assets => %w(development test))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module PhoebeboothanitquesCom2
  class Application < Rails::Application

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    # Enable the asset pipeline
    config.assets.enabled = true

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'

    config.time_zone = 'Central Time (US & Canada)'
    #config.time_zone = 'Central Time (US & Canada)'  
    
<<<<<<< HEAD
    #config.middleware.use PDFKit::Middleware
    require 'pdfkit'
    config.middleware.use PDFKit::Middleware
    
=======

>>>>>>> 155df5c196845e601546793c68862416eb7b97e6
  end
end
