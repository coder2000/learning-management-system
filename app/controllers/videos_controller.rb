class VideosController < ApplicationController
  def create
    @repo = current_user.video_repositories.find(params[:video_repository_id])
    @repo.videos.create!(data)
  end

  def destroy
  end

  def show
  end

  private

  def data
    params.require(:video).permit(:video)
  end
end
