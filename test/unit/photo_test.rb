require 'test_helper'

class PhotoTest < ActiveSupport::TestCase

  test "not create duplicate photo" do 
  	Photo.create(url: "http://photo.jpg")
  	assert Photo.new(url: "http://photo.jpg").invalid?
  end

  test "not create photo without url" do 
  	assert Photo.new(url: "").invalid?
  end
end
