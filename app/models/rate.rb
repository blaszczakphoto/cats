class Rate < ActiveRecord::Base
  attr_accessible :photo_id, :user_id
  belongs_to :rate
  validates :photo_id, :uniqueness => {:scope => :user_id}

end
