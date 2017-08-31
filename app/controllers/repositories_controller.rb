# Repositories controller
class RepositoriesController < ApplicationController
  before_action :admin?
  before_action :repository, only: [:show]

  def index
    @repositories = current_user.repositories
    authorize @repositories, :index?
  end

  def create
    repository = current_user.repositories.new(data)
    authorize repository, :create?
    if repository.save!
      redirect_to repositories_path(repository.id),
                  flash: { success: 'Repository Created' }
    else
      redirect_to root_url
    end
  end

  def show
    authorize @repository, :show?
    @record = @repository.records.new
  end

  private

  def repository
    @repository = Repository.find(params[:id])
  end

  def data
    params.require(:repository).permit(:title)
  end
end
