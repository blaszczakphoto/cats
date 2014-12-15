class Photo < ActiveRecord::Base
  attr_accessible :title, :url
  validates :url, presence: true
  validates :url, uniqueness: true

  def self.get_two_random(user_cookie = false)
  	offset1, offset2 = rand(self.count), rand(self.count)
  	offset2 = rand(self.count) while offset2 == offset1
		return [self.offset(offset1).first, self.offset(offset2).first]
  end

end
