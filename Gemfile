source 'https://rubygems.org'
ruby '2.2.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0.4'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
# gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'jquery-turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'puma', '~> 2.11.0'
gem 'foreman', '~> 0.78.0'
gem "bower-rails", "~> 0.9.2"
gem 'slim-rails', '~> 3.0.1'

gem 'sorcery', '~> 0.9.1'
gem 'cancancan', '~> 1.10'
# gem 'simple_form', '~> 3.1.0'
# gem 'draper', '~> 2.1.0'
gem 'enumerize'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'rspec-rails', '~> 3.2.1'
  gem 'factory_girl_rails', '~> 4.5.0'
  gem 'ffaker', '~> 1.25.0'
  gem 'zonebie'
end

group :development do
  gem "spring-commands-rspec"
  gem 'quiet_assets'

  # quality
  gem 'bullet'
  gem "rubycritic", :require => false
  gem 'cane'

  gem 'guard', '~> 2.11.1'
  gem 'guard-spring'
  gem 'guard-rspec', require: false
  gem 'guard-bundler', require: false
  gem 'guard-rubocop'
  gem 'guard-rubycritic'

  # TODO: rails g rename:app_to New-Name
  gem 'rename'
end

group :test do
  gem 'database_cleaner'
  gem 'simplecov', '~> 0.9.1', require: false
  gem 'rubocop', '~> 0.28.0', require: false
  gem 'poltergeist'
  gem 'shoulda-matchers', '~> 2.8.0', require: false
end
