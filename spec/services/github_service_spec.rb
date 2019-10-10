require 'rails_helper'

RSpec.describe "github api service" do
    it "returns a users repos", :vcr do
        evette = create(:user, github_token: ENV["GITHUB_TOKEN"])
        service = GithubService.new
        repos = service.get_repos(evette)

        expect(repos.first).to have_key(:name)
        expect(repos.first).to have_key(:html_url)
    end

    it "returns a users followers", :vcr do
        evette = create(:user, github_token: ENV["GITHUB_TOKEN"])
        service = GithubService.new
        followers = service.get_followers(evette)

        expect(followers.first).to have_key(:login)
        expect(followers.first).to have_key(:html_url)
    end

    it "returns a users following(ers?)", :vcr do
        evette = create(:user, github_token: ENV["GITHUB_TOKEN"])
        service = GithubService.new
        following = service.get_following(evette)

        expect(following.first).to have_key(:login)
        expect(following.first).to have_key(:html_url)
    end
end
