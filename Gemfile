source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.0"

gem "bootsnap", require: false
gem "bootstrap", "~> 5.1"
gem "devise", "~> 4.8"
gem "geocoder", "~> 1.8"
gem "gon", "~> 6.4"
gem "importmap-rails"
gem "jbuilder"
gem "omniauth-facebook", "~> 9.0"
gem "omniauth-rails_csrf_protection", "~> 1.0"
gem "omniauth-google-oauth2", "~> 1.0"
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.3"
gem "sassc-rails"
gem "sprockets-rails"
gem "sqlite3", "~> 1.4"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "rspec-rails", "~> 5.1"
  gem "shoulda-matchers", "~> 5.1"
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara", "~> 3.37"
  gem "cucumber-rails", "~> 2.5", require: false
  gem "database_cleaner", "~> 2.0"
end
