class Video < ActiveRecord::Base
  attr_accessible :description, :link

  validates :description, presence: true, length: { maximum: 140 }
  VALID_VIDEO_LINK = /youtube\.com\/watch\?v\=.+/i
  validates :link, presence: true, format: { with: VALID_VIDEO_LINK }
end