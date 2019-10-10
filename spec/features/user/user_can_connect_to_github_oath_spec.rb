# As a user
# When I visit /dashboard
# Then I should see a link that is styled like a button that says "Connect to Github"
# And when I click on "Connect to Github"
# Then I should go through the OAuth process
# And I should be redirected to /dashboard
# And I should see all of the content from the previous Github stories (repos, followers, and following)
require 'rails_helper'

  describe "authentication"  do
      it "github link should lead to github authentication page" do
          user = create(:user)
          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

          visit dashboard_path

          OmniAuth.config.test_mode = true

          omniauth_hash = { 'provider' => 'github',
                            'uid' => '12345',
                            'info' => {
                              'nickname' => 'wolfejob'
                            },
                            'credentials' => {
                              'token' => ENV['GITHUB_TOKEN']
                            } }

          OmniAuth.config.add_mock(:github, omniauth_hash)

          click_link 'Link to Github'
          user.reload
          save_and_open_page
          expect(page).to have_content("Repos")
        end
      end
