class PostsController < ApplicationController
  def show
    group
  end

  private

  def group
    @group ||= Group.find_by_token params[:id]
  end
end
