class UserActivationMailer < ApplicationMailer
  def activate(user)
    @user = user
    mail(to: @user.email, subject: "Activate your Account!")
  end
end
