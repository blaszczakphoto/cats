require 'test_helper'
require "photos_puller"

class PhotosPullerTest < ActiveSupport::TestCase

  def test_pulling_photos_by_tag
    photos = PhotosPuller.pull("cat")
    assert_equal photos.count, 100
  end

end