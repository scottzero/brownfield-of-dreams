require 'rails_helper'

describe "Admin deletes tutorial" do
	let(:admin)    { create(:admin) }

	it "and it deletes all videos" do
		allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

		tutorial = create(:tutorial)
		video = create(:video, tutorial_id: tutorial.id)

		visit admin_dashboard_path

		click_on "Destroy"

		expect(page).to have_content("Tutorial deleted")
		expect(page).to_not have_content(tutorial.title)
	end
end