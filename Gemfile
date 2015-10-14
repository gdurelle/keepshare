source 'https://rubygems.org'
ruby '2.2.3'

gem 'rails', '4.2.4'
gem 'sqlite3'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'puma', '~> 2.11.0'
gem 'foreman', '~> 0.78.0'
gem 'sorcery', '~> 0.9.1'
gem 'cancancan', '~> 1.13.0'
gem 'enumerize'

group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'rspec-rails', '~> 3.2.1'
  gem 'factory_girl_rails', '~> 4.5.0'
  gem 'ffaker', '~> 1.25.0'
  gem 'zonebie'
end

group :development do
  gem "spring-commands-rspec"
  gem 'quiet_assets'
  gem 'bullet'
  gem "rubycritic", :require => false
  gem 'cane'
  gem 'guard', '~> 2.11.1'
  gem 'guard-spring'
  gem 'guard-rspec', require: false
  gem 'guard-bundler', require: false
  gem 'guard-rubocop'
  gem 'guard-rubycritic'
end

group :test do
  gem 'database_cleaner'
  gem 'simplecov', '~> 0.9.1', require: false
  gem 'rubocop', '~> 0.28.0', require: false
  gem 'shoulda-matchers', '~> 2.8.0', require: false
end
