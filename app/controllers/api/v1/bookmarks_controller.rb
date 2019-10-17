class Api::V1::BookmarksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    bookmark = UserVideo.create(bookmark_params)
    render json: bookmark
  end

  private
    def bookmark_params
      params.require(:bookmark).permit(:user_id, :video_id)
    end
  end
