class GithubInviteMailer < ApplicationMailer
  def invite(user, github_handle)
    invitee = InvitesFacade.new(github_handle)
    @email = invitee.email
    @name = invitee.name
    @user = user
    if @email != []
      mail(to: @email, subject: "#{@user.first_name} sent you an invite!")
    end
  end
end
