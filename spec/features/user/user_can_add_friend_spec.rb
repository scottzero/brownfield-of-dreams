require 'rails_helper'

describe "adding a friend" do
	it "should show link to add friend if github handle is also a user", :vcr do
		evette = create(:user, github_token: ENV["GITHUB_TOKEN"], uid: "50186721")
		scott = create(:user, github_token: ENV["SCOTT_GITHUB_TOKEN"], uid: "33855435")
		
		visit "/"

		click_on "Sign In"

        fill_in 'session[email]', with: evette.email
        fill_in 'session[password]', with: evette.password

		click_on "Log In"

		visit dashboard_path

		within ".following" do
			click_on "Add Friend"
		end

		expect(page).to have_content("Yay! You're now friends with #{scott.first_name}")
	end
end