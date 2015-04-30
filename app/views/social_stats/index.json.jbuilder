json.array!(@social_stats) do |social_stat|
  json.extract! social_stat, :id, :site_id, :is_multisite, :wordpress_version, :plugin_version, :plugin_settings, :api_connection_status
  json.url social_stat_url(social_stat, format: :json)
end
