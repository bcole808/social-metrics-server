class ChangeHstoreToJsonOnSocialStats < ActiveRecord::Migration
  def up
  	change_column :social_stats, :plugin_settings, 'json USING CAST(plugin_settings AS json)', default: '{}'
  	change_column(:social_stats, :api_connection_status, 'json USING CAST(api_connection_status AS json)', {default: '{}'})
  end

  def down
  	remove_column :social_stats, :plugin_settings
  	remove_column :social_stats, :api_connection_status

  	add_column :social_stats, :plugin_settings, :hstore
  	add_column :social_stats, :api_connection_status, :hstore
  end
end