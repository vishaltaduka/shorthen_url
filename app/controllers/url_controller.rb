class UrlController < ApplicationController

	def shorthen_url
	end

	def customize_url
		original_url = params[:og_url]
		data = ShorthenUrl.find_or_create_by(original_url: original_url)
		if data.short_url.present?
			render json: {"short_url" => data.short_url, "status" => "success"}
		else
			short_url = "http://localhost:3000/" + data.id.to_s(36)
			data.update(short_url: short_url, expire_at: Date.today + 30.days)
			render json: {"short_url" => data.short_url, "status" => "success"}
		end
		
	end

	def send_to_url
		id = params[:short].to_i
		data = ShorthenUrl.find_by("id = ? AND expire_at > ?", id, Date.today )
		if data.present?
			# ShorthenUrl.where(id: data.id).update_all("no_, 1)
			redirect_to data.original_url
			ShorthenUrl.where(id: data.id).update_all ["no_of_clicks = no_of_clicks + ?", 1]
		else
			raise ActionController::RoutingError.new('404 Not Found')
		end

	end
end
