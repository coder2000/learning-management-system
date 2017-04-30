class RepositoriesController < ApplicationController
  before_filter :admin?
  before_filter :repository, only: [:show]

  def create
    @repository = current_user.repositories.new(data)
    if @repository.save
      redirect_to repositories_path(repository.id), notice: "Repository Created"
    else
      redirect_to root_url
    end
  end

  def show
    @record = @repository.records.new
  end

  private

  def repository
    @repository = Repository.find params[:id]
  end

  def data
    params.require(:repository).permit(:title)
  end
end
