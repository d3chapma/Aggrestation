source 'http://rubygems.org'

gem 'rails', '3.1.3'
gem 'sqlite3'
gem 'feedzirra'
gem 'jquery-rails'
gem 'haml'
gem 'simple_form' 


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'bootstrap-sass'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'guard'
  gem 'growl'
  gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
  gem 'guard-rspec'
  gem 'guard-spork'
end

group :test do
  # Pretty printed test output
  gem 'turn', '~> 0.8.3', :require => false
  gem 'launchy'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'spork', '~> 0.9.0.rc'
  gem 'fuubar'
  gem 'factory_girl_rails'
end


