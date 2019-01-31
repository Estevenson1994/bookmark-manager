require 'capybara/rspec'
require 'capybara'
require 'simplecov'
require 'simplecov-console'
require File.join(File.dirname(__FILE__), '..', 'app.rb')
require 'web_helper.rb'
ENV['ENVIRONMENT'] = 'test'
Capybara.app = BMManager

RSpec.configure do |config|
  config.before(:each) do
  db_setup
  end
end
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
 SimpleCov::Formatter::Console,
])
SimpleCov.start
