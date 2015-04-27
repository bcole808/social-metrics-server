# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
#run Rails.application

require './app/v1.0/metrics_tracker.rb'
run Sinatra::Application