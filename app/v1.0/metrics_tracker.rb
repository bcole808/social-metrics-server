require 'sinatra'
require 'yaml'
require 'net/http'
require 'uri'

# Initialize Configuration
CONFIG = YAML.load_file('./config/setup.yml')

# Main Request Callback

get '/v1.0/stats' do

	 url = params[:url]

	 uri = URI.parse('https://graph.facebook.com/v2.3/')
	 uri.query = Rack::Utils.build_query(
	 	id:           url,
	 	fields:       'share, og_object{id,url,engagement}',
	 	access_token: CONFIG['fb_access_token']
	 )

	response = Net::HTTP.get_response(uri)
	Net::HTTP.get_print(uri)

	response.body
end

get '/v1.0/login' do

end
