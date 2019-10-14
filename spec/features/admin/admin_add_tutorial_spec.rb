require 'rails_helper'

xdescribe "Admin creates a new tutorial" do
	let(:admin)    { create(:admin) }

	it "creates tutorial and video" do
		allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

		visit admin_dashboard_path

		click_on "New Tutorial"

		fill_in "tutorial[title]", with: "Learning to do stuff"
		fill_in "tutorial[description]", with: "stuff you learn to do"
		fill_in "tutorial[thumbnail]", with: "img.jpg"
		fill_in "videos_attributes_0_first_name", with: "How to tie your shoes."
		fill_in "videos_attributes_0_description", with: "Over, under, around and through, Meet Mr. Bunny Rabbit, pull and through."
		fill_in "videos_attributes_0_thumbnail", with: "img.jpg"
		fill_in "videos_attributes_0_video_id", with: "J7ikFUlkP_k"
	end
end