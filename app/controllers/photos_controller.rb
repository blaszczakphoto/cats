class PhotosController < ApplicationController
	def index
		@photos = Photo.get_two_random(current_user)
	end
end