class GithubUser
  attr_reader :name, :url, :uid

  def initialize(data)
    @name = data[:login]
    @url = data[:html_url]
    @uid = data[:id].to_s
  end

  def registered?
    User.any? { |user| user.uid == @uid }
  end

  def user
    User.find_by(uid: @uid)
  end

  def friends?(current_user)
    # binding.pry
    Friendship.exists?(user_id: self.user.id, friend_id: current_user.id) ||
    Friendship.exists?(friend_id: self.user.id, user_id: current_user.id)
  end
end
