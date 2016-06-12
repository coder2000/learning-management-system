class VideosController < ApplicationController
  def create
    @repo = current_user.video_repositories.find(params[:video_repository_id])
    @video = @repo.videos.create!(data)
  end

  def destroy
  end

  def show
    @video = Video.find(params[:id])
  end

  private

  def data
    params.require(:video).permit(:video)
  end
end
