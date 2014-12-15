class PhotoFromFlickr
	def self.create(flickr_params)
		params = {
			url: "https://farm%{farm}.staticflickr.com/%{server}/%{id}_%{secret}.jpg" % flickr_params,
			title: flickr_params[:title]
		}
		Photo.create(params)
	end
end