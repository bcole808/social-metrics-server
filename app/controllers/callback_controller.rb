class CallbackController < ApplicationController
	skip_before_action :verify_authenticity_token

	# POST /callback/stats
	def stats
		if SocialStat.where(site_id: social_stat_params["site_id"]).blank?
			@social_stat = SocialStat.new(social_stat_params)
			@social_stat.save
			render nothing: true
		else
			@social_stat = SocialStat.find_by(site_id: params["site_id"])
			@social_stat.update(social_stat_params)
			render nothing: true
		end
	end

private

	def social_stat_params
     	params.permit(:site_id, :is_multisite, :wordpress_version, :plugin_version).tap do |whitelisted|
       		whitelisted[:plugin_settings] = params[:plugin_settings]
       		whitelisted[:api_connection_status] = params[:api_connection_status]
     	end
    end
end
