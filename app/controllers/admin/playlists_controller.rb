class Admin::PlaylistsController < Admin::BaseController
	def new
	end

	def create
		@playlist = YouTube::Playlist.by_id(playlist_params[:youtube_id])
		tutorial = Tutorial.new(@playlist.instance_values)
		if tutorial.save
			@playlist.create_videos(tutorial)
			flash[:notice] = "Tutorial created!"
			redirect_to tutorial_path(tutorial)
		else
			flash[:notice] = tutorial.errors.full_messages.to_sentence
			render :new
		end
	end

	private
	def playlist_params
		params.require(:playlist).permit(:youtube_id)
	end
end