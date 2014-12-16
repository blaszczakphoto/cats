class Photo < ActiveRecord::Base
  attr_accessible :title, :url
  validates :url, presence: true
  validates :url, uniqueness: true
  has_many :rates

  def self.get_two_random(user_cookie = false)
  	offset1, offset2 = rand(self.count), rand(self.count)
  	offset2 = rand(self.count) while offset2 == offset1
		return [self.offset(offset1).first, self.offset(offset2).first]
  end

  def self.top_rated_last_week
  	self.select("photos.id, count(rates.id), photos.url, photos.title").
		  	joins(:rates).
		  	where('rates.created_at >= ?', 1.week.ago).
		  	group("photos.id").
		  	order("count(rates.id) DESC").
		  	limit(3)
  end

end