class InvitesController < ApplicationController
  def create
    invitee = InvitesFacade.new(params[:github_handle])
    email = invitee.email
    name = invitee.name
    GithubInviteMailer.invite(current_user, email, name).deliver_now
    if !email
      flash[:notice] = "No email listed for this user"
    else
      flash[:notice] = "Invite sent!"
    end
    redirect_to dashboard_path
  end
end
