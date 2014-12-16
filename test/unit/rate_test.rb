require 'test_helper'

class RateTest < ActiveSupport::TestCase
  test "can not rate the same user the same photo" do
  	Rate.create(user_id: "a", photo_id: 1)
    assert Rate.create(user_id: "a", photo_id: 1).invalid?
  end
end
