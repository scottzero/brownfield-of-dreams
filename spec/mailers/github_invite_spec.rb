# require "rails_helper"

# RSpec.describe GithubInviteMailer, type: :mailer do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

require "rails_helper"

RSpec.describe GithubInviteMailer, type: :mailer do
  let(:user) { create(:user) }
  let(:mail) { GithubInviteMailer.invite(user, "etelyas@gmail.com", "evette").deliver_now }
  
  it "has the send to email address" do
    expect(mail.to[0]).to eq('etelyas@gmail.com')
  end
  
  it "has an sign-up link" do
    expect(mail.body.encoded).to have_link("Here")
  end
end