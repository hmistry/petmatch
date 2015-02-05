source 'https://rubygems.org'


gem 'rails', '4.1.6'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'

gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc

gem 'spring',        group: :development

gem 'unicorn'

gem 'bootstrap-sass'
gem 'haml'
gem 'haml-rails'

gem 'erb2haml', group: :development

gem 'simple_form'
gem 'bootstrap-will_paginate'

gem 'mongoid'

# gem 'simplecov', require: false, group: :test
gem 'rack-mini-profiler', group: :development

gem 'httparty'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :test do
  gem 'database_cleaner'
  gem 'launchy'
  gem 'capybara'
end

group :test, :development do
  gem 'byebug'
  gem 'guard-rspec'
  gem 'spring-commands-rspec'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

group :production do
  gem 'rails_12factor'
end

ruby "2.1.2"
