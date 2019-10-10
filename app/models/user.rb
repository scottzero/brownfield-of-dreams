class User < ApplicationRecord
  has_many :user_videos
  has_many :videos, through: :user_videos

  validates :email, uniqueness: true, presence: true, if: :no_github_token?
  validates_confirmation_of :password, require: true
  validates_presence_of :first_name
  enum role: { default: 0, admin: 1 }
  has_secure_password

  def no_github_token?
    !self.github_token
  end

  def update_github(token, uid)
    self.github_token = token
    self.uid = uid
    self.save
  end
end
