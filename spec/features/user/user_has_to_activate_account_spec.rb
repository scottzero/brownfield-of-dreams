require 'rails_helper'

describe "account activation" do
	it "prompts user to activate their accout" do
		user = create(:user)

    	visit '/'

    	click_on "Sign In"

    	fill_in 'session[email]', with: user.email
    	fill_in 'session[password]', with: user.password

    	click_on 'Log In'

		expect(page).to have_content("This account has not yet been activated. Please check your email.")
		
		visit "/users/#{user.confirm_token}/confirm_email"

		expect(page).to have_content("Status: Active")
	end

	it "won't activate if account does not match token" do
		user = create(:user)

    	visit '/'

    	click_on "Sign In"

    	fill_in 'session[email]', with: user.email
    	fill_in 'session[password]', with: user.password

    	click_on 'Log In'

		expect(page).to have_content("This account has not yet been activated. Please check your email.")
		
		visit "/users/1234567890/confirm_email"

		expect(page).to have_content("User does not exist")
	end
end