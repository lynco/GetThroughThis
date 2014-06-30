# -*- coding: utf-8 -*-
source 'https://rubygems.org'

ruby '2.1.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Needed for default layouts
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'underscore-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# Adding Doorkeeper
gem 'doorkeeper'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

gem 'gmaps4rails'

gem 'geocoder'

gem 'devise'
gem 'haml-rails'
gem 'cancan'

gem 'resque'
gem 'resque-web', require: 'resque_web'
gem 'resque-scheduler'

group :production do
  gem 'pg'
  gem 'activerecord-postgresql-adapter'
end

gem 'therubyracer'
gem 'less-rails'

gem 'formtastic'
gem 'formtastic-bootstrap', github: 'mjbellantoni/formtastic-bootstrap'

gem 'elasticsearch-model'

group :development do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
end

group :development do
      
  gem 'thin'
  gem 'pry'
  gem 'pry-remote'
  gem 'pry-stack_explorer'

  # This needs to be here, else 'rake spec' will output nothing.
  gem 'rspec-rails'
end

#testing with rspec

group :test do
  gem 'rspec-rails'
  gem 'shoulda-matchers'

  gem 'capybara'
  gem 'selenium-webdriver'
  gem "factory_girl_rails"
  gem 'database_cleaner'
  gem "email_spec"
end

# Image uploading
gem 'paperclip'
