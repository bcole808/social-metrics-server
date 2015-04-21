require 'sinatra'
require 'httparty'

# Initialize Configuration
CONFIG = YAML.load_file('./config/setup.yml')

# Main Request Callback

get '/v1.0/stats' do

	puts "in do."

	url = params[:url]
	puts url

	batch_req = [
		{
			method: "GET",
			name: "get-url-stats",
			relative_url: "v2.3/?id=#{url}",
			omit_response_on_success: false
		},
		{
			method: "GET",
			name: "likes",
			relative_url: "v2.3/{result=get-url-stats:$.og_object.id}?fields=likes.summary(true).limit(0)"
		}
	]

	puts "before route."

	route = "https://graph.facebook.com/?access_token=#{CONFIG['fb_access_token']}&batch=#{URI.encode(batch_req.to_json)}"
	response = HTTParty.post(route)

	puts response.inspect

end