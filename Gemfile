# Settings
# ========
source 'http://rubygems.org'

# Rails
# =====
gem 'rails'

# Database
gem 'mysql2'

gem 'compass'
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier', '>= 1.0.3'
  gem 'fancy-buttons'
end

gem 'execjs'
gem 'therubyracer'

# Development
# ===========
group :development do
  # Haml generators
  gem 'hpricot'
  gem 'ruby_parser'

  # Deployment
  # gem 'capones_recipes', '0.14.3'
end


group :test, :development do
  # Generators
  gem 'rails3-generators'
end

gem 'haml'
gem 'haml-rails'
gem 'jquery-rails'
gem 'coffee-script'

gem 'kuhsaft'

# Monitoring
# ==========
group :production do
  # Google Analytics
  gem 'rack-google_analytics', :require => "rack/google_analytics"
  # Monitoring with new relic
  # gem 'newrelic_rpm'
  # Hoptoad for error catching
  # gem 'hoptoad_notifier'
end
