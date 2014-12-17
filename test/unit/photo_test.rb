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
    assert !photos.first.blank?
    assert !photos.last.blank?
  	assert_not_equal photos.first, photos.last
  end

  test "get two random not return photo when user already have voted all photos" do
    cookie_id = "abcd"
    Photo.all.each {|x| Rate.create(user_id: cookie_id, photo_id: x.id)}
    assert Photo.get_two_random("abcd").empty?
  end

  test "get two random not return photo when user already have voted without of 1 all photos" do
    cookie_id = "abcd"
    Photo.all.each {|x| Rate.create(user_id: cookie_id, photo_id: x.id)}
    Photo.first.rates.each(&:delete)
    assert Photo.get_two_random("abcd").empty?
  end

  test "top rated last week is ordered by ratings" do
    top = Photo.top_rated_last_week
    assert top.first.rates.count > top.last.rates.count
  end
  
  test "top rated last week is only from last week" do
    top = Photo.top_rated_last_week
    old_top, old_last = top.first, top.last
    5.times do
      user_id = rand(8)
      rate = Rate.create(photo_id: top.last.id, user_id: user_id)
      rate.created_at = 2.weeks.ago
      rate.save
    end
    top = Photo.top_rated_last_week
    assert old_top == top.first
  end



end
