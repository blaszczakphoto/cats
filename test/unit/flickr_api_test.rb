require 'test_helper'
require "flickr_api"

class FlickrApiTest < ActiveSupport::TestCase

  def test_recent_photos_by_tag
    flickr = FlickrApi.new
    photos = flickr.recent_photos_by_tag("cat")
    assert photos.count == 100
  end

end