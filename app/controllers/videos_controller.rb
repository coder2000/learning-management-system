class VideosController < ApplicationController
  def create
    @repo = current_user.video_repositories.find(params[:video_repository_id])
    @video = @repo.videos.create!(data)
  end

  def destroy
    video = Video.find(params[:id])
    if video
      video.remove_video!
      video.save
      video.delete
      redirect_to video_repository_path(params[:video_repository_id]), notice: "Video deleted"
    end
  end

  def show
    @video = Video.find(params[:id])
  end

  private

  def data
    params.require(:video).permit(:video)
  end
end
