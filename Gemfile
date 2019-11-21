# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'active_model_serializers'
gem 'aws-sdk-s3'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'rack-cors', require: 'rack/cors'
gem 'rails', '~> 6.0.0'
gem 'rswag-api'
gem 'rswag-ui'
gem 'devise_token_auth'
gem "pundit"
gem 'prawn'
gem 'chewy'

group :development, :test do
  gem 'coveralls', require: false
  gem 'factory_bot_rails'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'rswag-specs'
  gem 'shoulda-matchers'
  gem 'faker'
  gem 'pundit-matchers'
  gem 'pdf-inspector', require: "pdf/inspector"
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
