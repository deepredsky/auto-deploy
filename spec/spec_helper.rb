require File.join(File.dirname(__FILE__), '..', 'app')

set :environment, :test

require 'rubygems'
require 'bundler'
require 'sinatra'
require 'rspec'
require 'rack/test'

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
end

def app
  @app ||= Sinatra::Application
end

