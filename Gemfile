source 'https://rubygems.org'
ruby '2.1.1'

# Framework
gem 'rails', '4.0.3'

# Database
gem 'pg'

# Authentication
gem 'warden'

# Assets
gem 'jbuilder', '~> 1.2'
gem 'sass-rails',   '~> 4.0'
gem 'coffee-rails', '~> 4.0'
gem 'uglifier', '>= 1.3.0'
gem 'haml-rails'

# Helpers
gem 'active_decorator'

# Models
gem 'figaro'

# Views
gem 'bootstrap-sass'
gem 'compass-rails'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jquery-turbolinks'
gem 'simple_form'
gem 'rails-i18n'

# Server
gem 'thin'

group :doc do
  gem 'sdoc', require: false
end

group :development do
  # Debugs
  gem 'awesome_print'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'bullet'
  gem 'hirb'
  gem 'hirb-unicode'
  gem 'letter_opener'
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'pry-rails'
  gem 'pry-stack_explorer'
  gem 'pry-debugger'
  gem 'quiet_assets'
  gem 'rack-mini-profiler'
  gem 'tapp'
  gem 'view_source_map'
  gem 'i18n-tasks'
end

group :test, :development do
  # Rspec
  gem 'rspec-rails'
  gem 'factory_girl'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'delorean'
  gem 'shoulda-matchers'

  # Capybara
  gem 'nokogiri', '1.5.10' # for :eq support
  gem 'capybara'
  gem 'poltergeist'
  gem 'launchy'

  # Testing tools
  gem "database_cleaner", '1.0.0.RC1'
  gem "brakeman"

  # Capistrano
  gem 'capistrano'
  gem 'capistrano-ext'
  gem 'capistrano_colors'
  gem 'rvm-capistrano'

  # Guard
  gem 'guard-rspec', require: false
  gem 'guard-sprockets2'
  gem 'rb-fsevent', require: RUBY_PLATFORM.downcase =~ /darwin/ ? 'rb-fsevent' : false

  # Reset DB
  gem 'rails-db-resetup'
end

group :production, :staging do
  gem 'rails_12factor'
  gem 'newrelic_rpm'
end
