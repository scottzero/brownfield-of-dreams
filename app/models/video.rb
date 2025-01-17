class Video < ApplicationRecord
  validates_presence_of :title, :thumbnail, :description, :video_id
  has_many :user_videos
  has_many :users, through: :user_videos
  belongs_to :tutorial, inverse_of: :videos

  validates_presence_of :position, numericality: { greater_than_or_equal_to: 0 }

  scope :pos_0, -> { where(position: 0) }
end
