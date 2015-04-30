ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def load_api_fixture(filename)
  	YAML.load_file(Rails.root.join('test', 'api_responses', filename))
  end

  def http_login
  	user = Rails.application.secrets.basic_auth_name
  	password = Rails.application.secrets.basic_auth_password
  	hash = ActionController::HttpAuthentication::Basic.encode_credentials(user, password)
  	request.env['HTTP_AUTHORIZATION'] = hash
  end
end
