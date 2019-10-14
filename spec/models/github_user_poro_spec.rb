require 'rails_helper'

RSpec.describe GithubUser, type: :model do
  describe 'methods' do

    it "tests registered? method" do
      github_user = GithubUser.new(email: 'user@email.com', password: 'password', first_name:'Jim', role: 0)
      expect(github_user.registered?).to be_falsey
    end

    it "tests user method" do
      data = {:login => 'wolfejob', :html_url => nil, :id => "3"}
      github_user = GithubUser.new(data)
      expect(github_user.user).to be_falsey
    end

    it "tests friends? method" do
      data = {:login => 'wolfejob', :html_url => nil, :id => "33855435"}
      user = create(:user, github_token: ENV['GITHUB_TOKEN'], uid: "33855435" )
      user2 = create(:user, github_token: ENV['EVE_GITHUB_TOKEN'], uid: "50186721")
      github_user = GithubUser.new(data)
      buddies = Friendship.create(user_id: user.id, friend_id: github_user.user.id)
      expect(github_user.friends?(user)).to be_truthy
    end
  end
end
