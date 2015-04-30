require 'test_helper'

class CallbackControllerTest < ActionController::TestCase
 	setup do
 		@params = load_api_fixture 'sample_post.yml'
 	end

 	test "should save all stats to database" do
 		post :stats, @params
 		assert_equal "http://localhost:8888/wordpress-sandbox", social_stat.site_id
 		assert_equal false,                                     social_stat.is_multisite
 		assert_equal "4.2.1",                                   social_stat.wordpress_version
 		assert_equal "1.5.2",                                   social_stat.plugin_version
 		assert_equal expected_plugin_settings,                  social_stat.plugin_settings
 		assert_equal expected_api_connection_status,            social_stat.api_connection_status
 	end

 	test "updates when data already exists" do
 		post :stats, @params # Save it once
 		assert_no_difference 'SocialStat.count' do
 			post :stats, @params
 		end
 	end

 	test "creates record when data doesn't exist" do
 		assert_difference 'SocialStat.count', 1 do
 			post :stats, @params
 		end
 	end

 	teardown do
 		social_stat.destroy
 	end

private
	def social_stat
		 @social_stat ||= SocialStat.where(site_id: @params["site_id"]).first
	end

	def expected_plugin_settings
		{"smt_options_post_types_post"=>"post", "smt_options_post_types_page"=>"page", "smt_options_display_widget"=>"1", "smt_options_report_visibility"=>"edit_others_posts", "smt_options_ttl_hours"=>"4", "smt_options_default_sort_column"=>"aggregate", "smt_options_default_date_range_months"=>"0", "smt_options_default_posts_per_page"=>"10", "smt_options_url_protocol"=>"auto", "smt_options_url_rewrites"=>[{"rewrite_match_from"=>"http://localhost:8888/wordpress-sandbox", "rewrite_change_to"=>"", "rewrite_before_date"=>""}], "smt_options_alt_url_ttl_multiplier"=>"5", "smt_options_post_types"=>["post"], "smt_options_connection_type_facebook"=>"graph", "smt_options_post_types_sectors"=>"0", "smt_options_allow_debug_pingback"=>"1", "smt_options_last_debug_pingback"=>"1430384022"}	
	end

	def expected_api_connection_status
		[{"name"=>"Facebook", "slug"=>"facebook", "status"=>{"working"=>false, "fail_count"=>"9", "error_message"=>"An access token is required to request this resource. (OAuthException 104). Received HTTP response code: 400 Bad Request", "error_detail"=>{"request_time"=>"2015-04-30 08:53:40", "request_method"=>"get", "request_uri"=>"https://graph.facebook.com/v2.3?id=http%3A%2F%2Fwww.wordpress.org&fields=og_object%7Bengagement%7D&access_token=0", "request_response"=>{"headers"=>{"content-type"=>"application/json; charset=UTF-8", "www-authenticate"=>"OAuth \"Facebook Platform\" \"invalid_token\" \"An access token is required to request this resource.\"", "access-control-allow-origin"=>"*", "x-fb-rev"=>"1713404", "pragma"=>"no-cache", "cache-control"=>"no-store", "facebook-api-version"=>"v2.3", "expires"=>"Sat, 01 Jan 2000 00:00:00 GMT", "vary"=>"Accept-Encoding", "x-fb-debug"=>"5AKgRDnTtniLtqlh5/D/DDucU6quI5fxnloJBFGMUr10DskU6EUI/L3f/6i3yN+hy4Avc6z02K1TQro6Oa8z9g==", "date"=>"Thu, 30 Apr 2015 15:53:40 GMT", "connection"=>"close", "content-length"=>"112"}, "body"=>"{\"error\":{\"message\":\"An access token is required to request this resource.\",\"type\":\"OAuthException\",\"code\":104}}", "response"=>{"code"=>"400", "message"=>"Bad Request"}, "cookies"=>nil, "filename"=>nil}}, "last_query_at"=>"1430384020", "next_query_at"=>"1430394820"}}, {"name"=>"Twitter", "slug"=>"twitter", "status"=>{"working"=>true, "fail_count"=>"0", "error_message"=>"name lookup timed out", "error_detail"=>{"request_time"=>"2015-04-29 15:23:30", "request_method"=>"get", "request_uri"=>"http://urls.api.twitter.com/1/urls/count.json?url=http%3A%2F%2Flocalhost%3A8888%2Fwordpress-sandbox%2F%3Fp%3D27", "request_response"=>{"errors"=>{"http_request_failed"=>["name lookup timed out"]}, "error_data"=>nil}}, "last_query_at"=>"1430384020", "next_query_at"=>"1430384022"}}, {"name"=>"LinkedIn", "slug"=>"linkedin", "status"=>{"working"=>true, "fail_count"=>"0", "error_message"=>"name lookup timed out", "error_detail"=>{"request_time"=>"2015-04-29 15:23:33", "request_method"=>"get", "request_uri"=>"http://www.linkedin.com/countserv/count/share?format=json&url=http%3A%2F%2Flocalhost%3A8888%2Fwordpress-sandbox%2F%3Fp%3D27", "request_response"=>{"errors"=>{"http_request_failed"=>["name lookup timed out"]}, "error_data"=>nil}}, "last_query_at"=>"1430384021", "next_query_at"=>"1430384022"}}, {"name"=>"Google Plus", "slug"=>"googleplus", "status"=>{"working"=>true, "fail_count"=>"0", "error_message"=>"name lookup timed out", "error_detail"=>{"request_time"=>"2015-04-29 15:23:36", "request_method"=>"post", "request_uri"=>"https://clients6.google.com/rpc", "request_response"=>{"errors"=>{"http_request_failed"=>["name lookup timed out"]}, "error_data"=>nil}}, "last_query_at"=>"1430384021", "next_query_at"=>"1430384022"}}, {"name"=>"Pinterest", "slug"=>"pinterest", "status"=>{"working"=>true, "fail_count"=>"0", "error_message"=>"name lookup timed out", "error_detail"=>{"request_time"=>"2015-04-29 15:23:39", "request_method"=>"get", "request_uri"=>"http://api.pinterest.com/v1/urls/count.json?callback=receiveCount&url=http%3A%2F%2Flocalhost%3A8888%2Fwordpress-sandbox%2F%3Fp%3D27", "request_response"=>{"errors"=>{"http_request_failed"=>["name lookup timed out"]}, "error_data"=>nil}}, "last_query_at"=>"1430384021", "next_query_at"=>"1430384022"}}, {"name"=>"StumbleUpon", "slug"=>"stumbleupon", "status"=>{"working"=>true, "fail_count"=>"0", "error_message"=>"connect() timed out!", "error_detail"=>{"request_time"=>"2015-04-29 15:23:42", "request_method"=>"get", "request_uri"=>"http://www.stumbleupon.com/services/1.01/badge.getinfo?url=http%3A%2F%2Flocalhost%3A8888%2Fwordpress-sandbox%2F%3Fp%3D27", "request_response"=>{"errors"=>{"http_request_failed"=>["connect() timed out!"]}, "error_data"=>nil}}, "last_query_at"=>"1430384022", "next_query_at"=>"1430384022"}}]
	end
end
