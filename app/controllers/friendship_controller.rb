class FriendshipController < ApplicationController
  def create
    @user = current_user
    @friend = User.find_by(uid: params[:uid])
    Friendship.create(user_id: @user.id, friend_id: @friend.id)
    flash[:notice] = "Yay! You're now friends with #{@friend.first_name}"
    redirect_to dashboard_path
  end
end
