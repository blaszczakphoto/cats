class Photo < ActiveRecord::Base
  attr_accessible :title, :url
  validates :url, presence: true
  validates :url, uniqueness: true
end
