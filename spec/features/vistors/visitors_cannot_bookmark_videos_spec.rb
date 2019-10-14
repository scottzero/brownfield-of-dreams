require 'rails_helper'

describe "visitors must log in to bookmark a video" do
	it "shows a message telling the visitor to log in", :js => true do
		tutorial= create(:tutorial)
		video = create(:video, tutorial_id: tutorial.id)
		
		visit tutorial_path(tutorial)

		click_on "Bookmark"

		accept_alert

		expect(current_path).to eq(tutorial_path(tutorial))
	end
end