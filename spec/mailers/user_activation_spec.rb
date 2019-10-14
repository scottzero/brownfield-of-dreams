require "rails_helper"

RSpec.describe UserActivationMailer, type: :mailer do
  let(:user) { create(:user) }
  let(:mail) { UserActivationMailer.activate(user).deliver_now }

  it "shows a subject" do
    expect(mail.subject).to eq("Activate your Account!")
  end

  it "has the send to email address" do
    expect(mail.to[0]).to eq(user.email)
  end

  it "has an activation link" do
    expect(mail.body.encoded).to have_link("Visit here to activate your account!")
  end
end
