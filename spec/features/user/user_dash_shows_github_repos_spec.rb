require 'rails_helper'

describe "github API does not show repos" do
    it "if user is not logged in", :vcr do
        evette = create(:user)

        visit '/'

        click_on "Sign In"

        fill_in 'session[email]', with: evette.email
        fill_in 'session[password]', with: evette.password

        click_on 'Log In'

        expect(page).to_not have_content("Github Repos")
    end
end
