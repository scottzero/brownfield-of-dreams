require 'rails_helper'

describe "Admin can import a youtube playlist" do
	let(:admin)    { create(:admin) }

	it "by entering the playlist id", :vcr do
		allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

		visit admin_dashboard_path
		click_on "Import Playlist"

		fill_in "YouTube Playlist ID", with: "PLM_2iTuJFotS1nvTD4REIEq__oq0bFejz"

		click_on "Create Tutorial"

		tutorial = Tutorial.last

		expect(current_path).to eq(tutorial_path(tutorial))
		expect(page).to have_content(tutorial.title)
	end
end