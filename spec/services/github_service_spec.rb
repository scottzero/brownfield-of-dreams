require 'rails_helper'

RSpec.describe "github api service" do
    it "returns a users repos", :vcr do
        evette = create(:user, github_token: ENV["GITHUB_TOKEN"])
        service = GithubService.new
        repos = service.get_repos(evette)

        expect(repos.first).to have_key(:name)
        expect(repos.first).to have_key(:html_url)
    end
end
