RACK_ENV = 'test' unless defined?(RACK_ENV)
require File.expand_path(File.dirname(__FILE__) + "/../config/boot")
Dir[File.expand_path(File.dirname(__FILE__) + "/../app/helpers/**/*.rb")].each(&method(:require))
require 'capybara/rspec'
require 'capybara'
Capybara.app = Padrino.application
require 'database_cleaner'

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
  conf.include Capybara::DSL

  conf.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  conf.before(:each) do |example|
    DatabaseCleaner.strategy= example.metadata[:js] ? :truncation : :transaction
    DatabaseCleaner.start
  end

  conf.after(:each) do
    DatabaseCleaner.clean
  end
end

# You can use this method to custom specify a Rack app
# you want rack-test to invoke:
#
#   app Leadgen::App
#   app Leadgen::App.tap { |a| }
#   app(Leadgen::App) do
#     set :foo, :bar
#   end
#
def app(app = nil, &blk)
  @app ||= block_given? ? app.instance_eval(&blk) : app
  @app ||= Padrino.application
end
