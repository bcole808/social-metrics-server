require 'sinatra'

# Initialize Configuration
CONFIG = YAML.load_file('./config/setup.yml')

# Main Request Callback

get '/v1.0/stats' do

	url = params[:url]

	uri = URI.parse('https://graph.facebook.com/v2.3/')
	uri.query = Rack::Utils.build_query(
		id: url,
		fields: 'share, og_object{id,url,engagement}',
		access_token: CONFIG['fb_access_token']
	)

	req = Net::HTTP::Get.new(uri.to_s)

	res = Net::HTTP.new(uri.host, uri.port)
	res.verify_mode = OpenSSL::SSL::VERIFY_NONE
	res.use_ssl = true

	response = nil
	res.start do |http|
		response = http.request(req)
	end

	output = ""
	output << "#{response.body}"
	return output

end

get '/v1.0/login' do

end
