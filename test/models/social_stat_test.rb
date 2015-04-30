require 'test_helper'

class SocialStatTest < ActiveSupport::TestCase
 
  
  test "plugin_settings defaults to empty object" do
  	assert_equal({}, SocialStat.new.plugin_settings)
  end

  test "api_connection_satus defaults to empty object" do
  	assert_equal({}, SocialStat.new.api_connection_status)
  end
end
