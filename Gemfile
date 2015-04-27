source "https://rubygems.org"

gem "rails", "~> 4.2.0"

group :mysql do
  gem "mysql2"
end

group :postgres do
  gem "pg"
end

group :development, :test do
  gem "sqlite3"
end

gem "puma"
gem "slim"
# Use SCSS for stylesheets
gem "sass-rails"
gem "bootstrap-sass"
gem "font-awesome-rails"
# Use Uglifier as compressor for JavaScript assets
gem "uglifier"
# Use CoffeeScript for .js.coffee assets and views
gem "coffee-rails"
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem "therubyracer",  platforms: :ruby

# Use jquery as the JavaScript library
gem "jquery-rails"
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem "turbolinks"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder"
# bundle exec rake doc:rails generates the API under doc/api.
gem "sdoc", "~> 0.4.0", group: :doc

group :development do
  gem "spring" # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "pry-rails"
  gem "pry-byebug"
  gem "awesome_print"

  # Capistrano
  gem 'capones_recipes'
end

group :production do
  gem "rack-cache", require: "rack/cache"
end

gem "refinerycms",             github: "raskhadafi/refinerycms",           branch: "patch-1"
gem "refinerycms-i18n",        github: "refinery/refinerycms-i18n",        branch: "master"
gem "refinerycms-page-images", github: "refinery/refinerycms-page-images"
gem "quiet_assets"

# Add support for refinerycms-acts-as-indexed
gem "refinerycms-acts-as-indexed", ["~> 2.0", ">= 2.0.0"]
# Add support for refinerycms-wymeditor
gem "refinerycms-wymeditor", ["~> 1.0", ">= 1.0.0"]
gem "seo_meta", "~> 2.0.0.rc1"
gem "paper_trail"
