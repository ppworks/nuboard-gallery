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
gem 'kaminari'

# Server
gem 'puma'

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
  gem 'thin'
end

group :test, :development do
  # TDD
  gem 'brakeman'
  gem 'capybara'
  gem 'database_cleaner', '1.0.0.RC1'
  gem 'delorean'
  gem 'factory_girl'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'guard-rspec', require: false
  gem 'guard-sprockets2'
  gem 'json_expressions'
  gem 'launchy'
  gem 'nokogiri', '1.5.10' # for :eq support
  gem 'poltergeist'
  gem 'rails-db-resetup'
  gem 'rb-fsevent', require: RUBY_PLATFORM.downcase =~ /darwin/ ? 'rb-fsevent' : false
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'spring'
  gem 'spring-commands-rspec'
end

group :production, :staging do
  gem 'rails_12factor'
  gem 'newrelic_rpm'
end
