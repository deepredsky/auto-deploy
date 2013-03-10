$:.unshift File.expand_path(File.join(File.dirname(__FILE__), "lib"))

require 'rubygems'
require 'sinatra'
require 'auto_deploy'

use Rack::Auth::Basic, "Restricted Area" do |username, password|
  [username, password] == [ENV['AUTO_DEPLOY_USERNAME'], ENV['AUTO_DEPLOY_PASSWORD']]
end

get "/" do
  "Nothing here!"
end
