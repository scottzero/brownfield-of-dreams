require 'rails_helper'

RSpec.describe "github email api service" do
    it "returns a users email", :vcr do
        service = GithubEmailService.new
        info = service.get_email("evettetelyas")

		expect(info).to have_key(:email)
		expect(info).to have_key(:bio)
    end
end