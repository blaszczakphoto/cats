require 'test_helper'

class PhotoTest < ActiveSupport::TestCase

  test "not create duplicate photo" do 
  	Photo.create(url: "http://photo.jpg")
  	assert Photo.new(url: "http://photo.jpg").invalid?
  end

  test "not create photo without url" do 
  	assert Photo.new(url: "").invalid?
  end

  test "return two different photos" do
  	photos = Photo.get_two_random
  	assert_not_equal photos.first, photos.last
  end



end
