require 'rails_helper'

describe "user dashboard shows bookmarks" do
	it "in order of tutorial and position" do
		user = create(:user)
		tutorial= create(:tutorial)
    	video = create(:video, tutorial_id: tutorial.id)

    	visit '/'

    	click_on "Sign In"

    	fill_in 'session[email]', with: user.email
    	fill_in 'session[password]', with: user.password

		click_on 'Log In'
		
		visit tutorial_path(tutorial)
		
		click_on "#{video.title}"
		
		click_on "Bookmark"

		visit dashboard_path

		expect(page).to have_link("#{tutorial.title} | #{video.title}")
	end
end