require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:first_name)}
    it {should validate_presence_of(:password)}
  end

  describe 'roles' do
    it 'can be created as default user' do
      user = User.create(email: 'user@email.com', password: 'password', first_name:'Jim', role: 0)

      expect(user.role).to eq('default')
      expect(user.default?).to be_truthy
    end

    it 'can be created as an Admin user' do
      admin = User.create(email: 'admin@email.com', password: 'admin', first_name:'Bob', role: 1)

      expect(admin.role).to eq('admin')
      expect(admin.admin?).to be_truthy
    end

    it 'tests update github method' do
      admin = User.create(email: 'admin@email.com', password: 'admin', first_name:'Bob', role: 1, github_token: ENV['GITHUB_TOKEN'])
      admin.update_github(admin.github_token, nil)
      expect(admin.github_token).to eq(ENV['GITHUB_TOKEN'])
      expect(admin.uid).to eq(nil)
    end

    it "tests activate method" do
      admin = User.create(email: 'admin@email.com', password: 'admin', first_name:'Bob', role: 1, github_token: ENV['GITHUB_TOKEN'])
      expect(admin.activate).to be_truthy
    end

    it "tests no_github_token method " do
      admin = User.create(email: 'admin@email.com', password: 'admin', first_name:'Bob', role: 1, github_token: ENV['GITHUB_TOKEN'])
      expect(admin.no_github_token?).to be_falsey
    end

    it "tests bookmark method" do
      admin = User.create(email: 'admin@email.com', password: 'admin', first_name:'Bob', role: 1, github_token: ENV['GITHUB_TOKEN'])
      expect(admin.bookmarks.empty?).to be_truthy
    end
  end
end
