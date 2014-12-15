require "flickr_api"
require "photo_from_flickr"

class PhotosPuller
	def self.pull(tag)
		flickr = FlickrApi.new
		photos = flickr.recent_photos_by_tag(tag)
		photos.map do |photo_params|
			PhotoFromFlickr.create(photo_params)
		end
	end
end