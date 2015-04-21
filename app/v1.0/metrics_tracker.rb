require 'sinatra'

# Initialize Configuration
CONFIG = YAML.load_file('./config/setup.yml')

# Main Request Callback

get '/v1.0/stats' do

	puts params.inspect

end