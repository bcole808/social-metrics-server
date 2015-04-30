require 'test_helper'

class SocialStatsControllerTest < ActionController::TestCase
  setup do
    @social_stat = social_stats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:social_stats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create social_stat" do
    assert_difference('SocialStat.count') do
      post :create, social_stat: { api_connection_status: @social_stat.api_connection_status, is_multisite: @social_stat.is_multisite, plugin_settings: @social_stat.plugin_settings, plugin_version: @social_stat.plugin_version, site_id: @social_stat.site_id, wordpress_version: @social_stat.wordpress_version }
    end

    assert_redirected_to social_stat_path(assigns(:social_stat))
  end

  test "should show social_stat" do
    get :show, id: @social_stat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @social_stat
    assert_response :success
  end

  test "should update social_stat" do
    patch :update, id: @social_stat, social_stat: { api_connection_status: @social_stat.api_connection_status, is_multisite: @social_stat.is_multisite, plugin_settings: @social_stat.plugin_settings, plugin_version: @social_stat.plugin_version, site_id: @social_stat.site_id, wordpress_version: @social_stat.wordpress_version }
    assert_redirected_to social_stat_path(assigns(:social_stat))
  end

  test "should destroy social_stat" do
    assert_difference('SocialStat.count', -1) do
      delete :destroy, id: @social_stat
    end

    assert_redirected_to social_stats_path
  end
end
