json.array!(@social_stats) do |social_stat|
  json.extract! social_stat, :id, :site_id, :is_multisite, :wp_version, :plugin_version, :plugin_settings, :conn_status
  json.url social_stat_url(social_stat, format: :json)
end
