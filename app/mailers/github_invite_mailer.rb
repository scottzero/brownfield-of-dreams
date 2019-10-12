class GithubInviteMailer < ApplicationMailer
  def invite(user, email, name)
    @user = user
    @email = email
    @name = name
    mail(to: @email, subject: "#{@user.first_name} sent you an invite!")
  end
end
