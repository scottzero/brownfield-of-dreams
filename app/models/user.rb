class User < ApplicationRecord
  before_create :confirmation_token
  has_many :user_videos
  has_many :videos, through: :user_videos

  validates :email, uniqueness: true, presence: true, if: :no_github_token?
  validates_confirmation_of :password, require: true
  validates_presence_of :first_name
  enum role: { default: 0, admin: 1 }
  enum status: { inactive: 0, active: 1 }
  has_secure_password

  def no_github_token?
    !self.github_token
  end

  def update_github(token, uid)
    self.github_token = token
    self.uid = uid
    self.save
  end

  def bookmarks
    videos.order("videos.tutorial_id, videos.position")
  end

  def activate
    self.update(status: 1, confirm_token: nil)
    self.save
  end

  private
    def confirmation_token
      if self.confirm_token.blank?
          self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
    end
end
