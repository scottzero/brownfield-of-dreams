require 'rails_helper'

describe "github API shows repos" do
    it "on user dash", :vcr do
        evette = create(:user, github_token: ENV["github_token"])

        visit '/'

        click_on "Sign In"

        fill_in 'session[email]', with: evette.email
        fill_in 'session[password]', with: evette.password

        click_on 'Log In'

        expect(page).to have_content("Github Repos")
    end
end