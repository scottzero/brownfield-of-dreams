require 'rails_helper'

  describe "authentication"  do
    it "github link should lead to github authentication page", :vcr do
        user = create(:user)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        user.github_token = OmniAuth.config.mock_auth[:github]["credentials"]["token"]

        visit dashboard_path

        expect(page).to have_content("Repos")
      end
    end
