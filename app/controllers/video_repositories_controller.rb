class VideoRepositoriesController < ApplicationController
  before_filter :admin?
  def create
    repo = current_user.video_repositories.create!(data)
    redirect_to video_repository_path(repo.id),notice: "Video repository created successfuly"
  end

  def show
    @repo = VideoRepository.find(params[:id])
    @video = @repo.videos.new
  end

  private

  def data
    params.require(:video_repository).permit(:title)
  end
end
