class AddPropertiesToSocialStats < ActiveRecord::Migration
  def change
  	add_column :social_stats, :plugin_settings, :hstore
  	add_column :social_stats, :api_connection_status, :hstore
  end
end
