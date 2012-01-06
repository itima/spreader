require 'rbconfig'

HOST_OS = RbConfig::CONFIG['host_os']

source 'http://rubygems.org'

gem 'rails', '3.1.3'
gem 'unicorn'

group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

if HOST_OS =~ /linux/i
  gem 'therubyracer', '>= 0.9.8'
end

gem "haml", ">= 3.1.2"


gem "bson_ext", ">= 1.3.1"
gem "mongoid", ">= 2.3.3"
gem "omniauth", ">= 1.0.0"
gem "omniauth-facebook"
gem 'koala'
gem "twitter-bootstrap-rails"

gem 'hpricot'
gem 'ruby_parser'

gem 'daemons'
gem 'delayed_job'
gem 'delayed_job_mongoid'

group :development do
  gem "haml-rails", ">= 0.3.4"
  
  case HOST_OS
    when /darwin/i
      gem 'rb-fsevent'
      gem 'growl'
    when /linux/i
      gem 'libnotify'
      gem 'rb-inotify'
    when /mswin|windows/i
      gem 'rb-fchange'
      gem 'win32console'
      gem 'rb-notifu'
  end

  gem "guard-bundler", ">= 0.1.3"
  gem "guard-rails", ">= 0.0.3"
  gem "guard-livereload", ">= 0.3.0"
  gem "guard-rspec", ">= 0.4.3"
  gem "guard-cucumber", ">= 0.6.1"
  gem "rails-footnotes", ">= 3.7"
  gem "guard", ">= 0.6.2"
end

group  :development, :test do
  gem "rspec-rails", ">= 2.8.0.rc1"
end

group :test do
  gem "database_cleaner", ">= 0.7.0"
  gem "mongoid-rspec", ">= 1.4.4"
  gem "factory_girl_rails", ">= 1.4.0"
  gem "cucumber-rails", ">= 1.2.0"
  gem "capybara", ">= 1.1.2"
  gem "launchy", ">= 2.0.5"
end