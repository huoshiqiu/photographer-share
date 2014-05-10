source 'https://ruby.taobao.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.4'

# Use mysql as the database for Active Record
gem 'mysql2'

# views
gem 'sass-rails', '~> 4.0.2'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'bootstrap-sass', '~> 3.0.3.0'
gem 'bootstrap-select-rails'
gem 'kaminari'

# backend admin
gem 'rails_admin'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# api
gem 'grape'
gem 'jbuilder', '~> 1.2'

# user auth
gem 'devise'

# photo handling
gem 'carrierwave'
gem 'mini_magick'
gem "fog"

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development, :test do
  gem 'pry'
  gem 'rspec-rails'
  gem 'rspec-mocks'
  gem 'factory_girl_rails'
  gem 'capistrano', '~> 3.0.1'
  gem 'capistrano-rails'
  gem 'capistrano-rvm', '~> 0.1.0'
  gem 'guard-rspec'#, require: false
  gem 'meta_request'
  gem 'quiet_assets'
end

group :development do
  gem "better_errors"
  gem "binding_of_caller"
end


group :test do
  gem 'faker', '~> 1.1.2'
  gem 'capybara', '~> 2.2.1'
  gem 'database_cleaner', '~> 1.0.1'
  gem 'launchy', '~> 2.3.0'
end
