require 'sinatra'
require 'httparty'

# Initialize Configuration
CONFIG = YAML.load_file('./config/setup.yml')

# Main Request Callback

get '/v1.0/stats' do

	puts "in do."

	url = params[:url]
	puts url

	# uri = URI("https://graph.facebook.com/v2.3")
	# req = Net::HTTP::Post.new(uri.path)
	# attach = {'batch' => [{"method" => "GET","name" => "get-url-stats","relative_url" => "v2.3/?id=#{url}","omit_response_on_success" => false},{"method" => "GET","name" => "likes","relative_url" => "v2.3/{result=get-url-stats:$.og_object.id}?fields=likes.summary(true).limit(0)"}].to_json}
	# req.set_form_data(attach.merge('access_token' => CONFIG['fb_access_token']))

	# res = Net::HTTP.new(uri.host, uri.port)
	# res.verify_mode = OpenSSL::SSL::VERIFY_NONE
	# res.use_ssl = true

	# response = nil
	# res.start do |http|
	# 	response = http.request(req)
	# 	puts response.inspect
	# end

	batch_req = [{"method" => "GET","name" => "get-url-stats","relative_url" => "v2.3/?id=#{url}","omit_response_on_success" => false},{"method" => "GET","name" => "likes","relative_url" => "v2.3/{result=get-url-stats:$.og_object.id}?fields=likes.summary(true).limit(0)"}].to_json

	route = "https://graph.facebook.com/?access_token=#{CONFIG['fb_access_token']}&batch=#{URI.encode(batch_req)}"
	response = HTTParty.post(route)

	puts response.inspect

end