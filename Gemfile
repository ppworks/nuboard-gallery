source 'https://rubygems.org'
ruby '2.1.1'

gem 'rails', '4.0.3'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jquery-turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'sass-rails',   '~> 4.0'
gem 'coffee-rails', '~> 4.0'
gem 'uglifier', '>= 1.3.0'
gem 'haml-rails'
gem 'figaro'
gem 'warden'
gem 'sqlite3'
gem 'simple_form'
gem 'pg'
gem 'active_decorator'
gem 'rails-i18n'
gem 'thin'
gem 'compass-rails'
gem 'bootstrap-sass'

group :doc do
  gem 'sdoc', require: false
end

group :development do
  gem 'foreman'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'letter_opener'
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

  # Debug tool
  gem 'pry'
  gem 'tapp'
  gem 'awesome_print'
  gem 'spring', github: 'jonleighton/spring'

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
