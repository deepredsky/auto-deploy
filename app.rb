$:.unshift File.expand_path(File.join(File.dirname(__FILE__), "lib"))

require 'rubygems'
require 'sinatra'
require 'auto_deploy'

get "/" do
  "Hello World"
end
