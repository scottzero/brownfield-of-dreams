require 'rails_helper'
describe "as a visitor", type: :feature do
  it "i cant see tutorials marked as classroom content", :vcr do
    scotty = create(:user, github_token: ENV["GITHUB_TOKEN"])
    tutorial_1 = create(:tutorial, classroom: true)
    tutorial_2 = create(:tutorial, classroom: true)
    tutorial_3 = create(:tutorial, classroom: false)

    video_1 = create(:video, tutorial: tutorial_1)
    video_2 = create(:video, tutorial: tutorial_2)
    video_3 = create(:video, tutorial: tutorial_3)


    visit root_path

    expect(page).to_not have_content(tutorial_1.title)
    expect(page).to_not have_content(tutorial_2.title)
    expect(page).to have_content(tutorial_3.title)
  end
end
