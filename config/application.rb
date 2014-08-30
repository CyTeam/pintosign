require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Pintosign
  class Application < Rails::Application

    config.time_zone = 'Bern'

    config.i18n.default_locale = :de

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    # Enable the asset pipeline
    config.assets.enabled = true
    # Google analytics middle ware.
    if Rails.env.production?
      config.middleware.use("Rack::GoogleAnalytics", :web_property_id => 'UA-20112140-5') # Cause in the end the code is public viewble. I added it hardcoded.
    end
  end
end
