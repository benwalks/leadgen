RACK_ENV = 'test' unless defined?(RACK_ENV)
require File.expand_path(File.dirname(__FILE__) + "/../config/boot")
Dir[File.expand_path(File.dirname(__FILE__) + "/../app/helpers/**/*.rb")].each(&method(:require))
require 'capybara/rspec'
require 'capybara'
Capybara.app = Padrino.application

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
  conf.include Capybara
  conf.include Capybara::DSL
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
