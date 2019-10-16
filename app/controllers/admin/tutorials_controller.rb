class Admin::TutorialsController < Admin::BaseController
  def edit
    @tutorial = Tutorial.find(params[:id])
  end

  def destroy
    Tutorial.find(params[:id]).destroy
    flash[:success] = "Tutorial deleted."
    redirect_to :admin_dashboard
  end

  def create
    begin
      thumbnail = YouTube::Video.by_id(tutorial_params[:videos_attributes]["0"][:video_id]).thumbnail
      @tutorial = Tutorial.new(tutorial_params.merge(thumbnail: thumbnail))
      @tutorial.videos.first.update(thumbnail: thumbnail)
      if @tutorial.save && @tutorial.videos.first.save
        flash[:success] = "tutorial successfully created!"
        redirect_to tutorial_path(@tutorial)
      else
        flash[:error] = (@tutorial.errors.full_messages).uniq.to_sentence
        render :new
      end
    rescue
      flash[:error] = "Invalid YouTube Video ID"
      render :new
    end
  end

  def new
  end

  def update
    tutorial = Tutorial.find(params[:id])
    if tutorial.update(tutorial_params)
      flash[:success] = "#{tutorial.title} tagged!"
    end
    redirect_to edit_admin_tutorial_path(tutorial)
  end

  private
    def tutorial_params
      params.require(:tutorial).permit(:title, :description, :thumbnail, :tag_list, videos_attributes: [ :title, :description, :thumbnail, :video_id ])
    end
end
