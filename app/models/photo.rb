class Photo < ActiveRecord::Base
  attr_accessible :title, :url
  validates :url, presence: true
  validates :url, uniqueness: true
  has_many :rates

  def self.get_two_random(cookie_id = "")
    rated = Rate.select(:photo_id).where(user_id: cookie_id).map(&:photo_id)
    @photos = Photo.where('id NOT IN (?)', rated.blank? ? '' : rated)

    return [] if @photos.count <= 1
    range = (1..@photos.count).to_a
    offsets = [range.sample]
    range.delete(offsets.first)
    offsets.push(range.sample)

    offsets.map {|el| @photos.offset(el).first}.compact
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