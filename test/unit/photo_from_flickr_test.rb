# coding: utf-8

require 'test_helper'
require "photo_from_flickr"

class PhotoFromFlickrTest < ActiveSupport::TestCase

  test "generate url from params" do 
  	flickr_params = {
  		id: "15840486800", secret: "c6aff230e5", 
  		server: "7527", title: "Котики-4", farm: "4"}
  	assert_equal PhotoFromFlickr.create(flickr_params).url, "https://farm4.staticflickr.com/7527/15840486800_c6aff230e5.jpg"
  end

end
