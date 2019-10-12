class InvitesController < ApplicationController

	def create
		mail = GithubInviteMailer.invite(current_user, params[:github_handle]).deliver_now
		if mail.to.empty?
			flash[:notice] = "No email listed for this user"
		else
			flash[:notice] = "Invite sent!"
		end
		redirect_to dashboard_path
	end
end