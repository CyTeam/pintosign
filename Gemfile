# Settings
# ========
source 'http://rubygems.org'

# Rails
# =====
gem 'rails', "~> 3.1.0"

# Database
gem 'sqlite3'
gem 'mysql2'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier', '>= 1.0.3'
  gem 'compass', "~> 0.12.alpha.0"
  gem 'fancy-buttons'
end


# Development
# ===========
group :development do
  # Haml generators
  gem 'hpricot'
  gem 'ruby_parser'
  gem 'rcov'

  # Deployment
  gem 'capones_recipes', '0.14.3'
end

# Test
# ====
group :test do
  # Matchers/Helpers
  gem 'shoulda'

  # Mocking
  # gem 'mocha'

  # Browser
  gem 'capybara'

  # Autotest
  gem 'autotest'
  gem 'autotest-rails'
  gem 'ZenTest', '< 4.6.0' # Keep it working with gems < 1.8
end

group :test, :development do
  # Framework
  gem "rspec"
  gem 'rspec-rails'

  # Fixtures
  gem "factory_girl_rails", "~> 1.1.rc1"
  gem "factory_girl", "~> 2.0.0.rc1"

  # Integration
  # gem 'cucumber-rails'
  # gem 'cucumber'

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
