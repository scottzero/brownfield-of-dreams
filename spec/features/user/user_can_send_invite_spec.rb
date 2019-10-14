require 'rails_helper'

describe "sending email invitations" do
	it "won't send an email to a handle with no email listed", :vcr do
		user = create(:user)

    	visit '/'

    	click_on "Sign In"

    	fill_in 'session[email]', with: user.email
    	fill_in 'session[password]', with: user.password

		click_on 'Log In'

		click_on 'Send an Invite'

		fill_in :github_handle, with: "lalalallalallalallalalllallala"

		click_on "Send an Invite"

		expect(page).to have_content("No email listed for this user")
	end

	it "sends an email to users with an email listed", :vcr do
		user = create(:user)

    	visit '/'

    	click_on "Sign In"

    	fill_in 'session[email]', with: user.email
    	fill_in 'session[password]', with: user.password

		click_on 'Log In'

		click_on 'Send an Invite'

		fill_in :github_handle, with: "evettetelyas"

		click_on "Send an Invite"

		expect(page).to have_content("Invite sent!")
	end
end