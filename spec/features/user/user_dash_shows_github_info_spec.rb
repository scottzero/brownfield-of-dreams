require 'rails_helper'

describe "github API" do
    it "does not show github stats if user is not connected to github", :vcr do
        evette = create(:user)

        visit '/'

        click_on "Sign In"

        fill_in 'session[email]', with: evette.email
        fill_in 'session[password]', with: evette.password

        click_on 'Log In'

        expect(page).to have_button("Link to Github")
    end

    it "does show github info if user is connected to github", :vcr do
        evette = create(:user, github_token: ENV["GITHUB_TOKEN"])

        visit '/'

        click_on "Sign In"

        fill_in 'session[email]', with: evette.email
        fill_in 'session[password]', with: evette.password

        click_on 'Log In'

        expect(page).to have_content("Repos")
        expect(page).to have_content("Followers")
        expect(page).to have_content("Following")
        expect(page).to have_content("Friends")
        expect(page).to_not have_content("Link to Github")
    end
end
