class CreateSocialStats < ActiveRecord::Migration
  def change
    create_table :social_stats do |t|
      t.string :site_id
      t.boolean :is_multisite
      t.string :wp_version
      t.string :plugin_version

      t.timestamps
    end
  end
end
