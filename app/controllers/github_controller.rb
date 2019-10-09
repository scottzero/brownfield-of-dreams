class GithubController < ApplicationController

    def create
        token = request.env["omniauth.auth"]["credentials"]["token"]
        uid = request.env["omniauth.auth"]["uid"]
        user = User.find(current_user.id)
        user.update_github(token, uid)
        redirect_to dashboard_path
    end
end