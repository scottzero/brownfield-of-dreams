require 'rails_helper'

xdescribe "Admin creates a new tutorial" do
	let(:admin)    { create(:admin) }

	it "creates tutorial and video" do
		allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

		visit admin_dashboard_path

		click_on "New Tutorial"

		within(".new-tutorials") do
			fill_in "Tutorial Title", with: "Learning to do stuff"
			fill_in "Tutorial Description", with: "stuff you learn to do"
		end

		within(".new-videos") do
			fill_in "Title", with: "How to tie your shoes."
			fill_in "Description", with: "Over, under, around and through, Meet Mr. Bunny Rabbit, pull and through."
			fill_in "YouTube ID", with: "J7ikFUlkP_k"
		end

		click_button "Save"

		tutorial = Tutorial.last

		expect(page).to have_content("Tutorial successfully created!")
		expect(current_path).to eq(tutorial_path(tutorial))
	end
end