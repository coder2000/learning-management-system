# Posts controller
class PostsController < ApplicationController
  before_action :group, only: %i[show create]
  before_action :post, only: [:show]

  def show; end

  def create
    @post = @group.posts.create(data.merge! user: current_user)
    if params.has_key?(:attachments)
      params[:attachments].each do |file|
        if file.present?
          doc = Record.find file
          @post.attachments << doc
        end
      end
    end

    respond_to do |format|
      format.js { @post }
    end
  end

  private

  def data
    params.require(:post).permit(:content, :video, :attachments)
  end

  def group
    @group ||= Group.find_by_token params[:group_id]
  end

  def post
    @post ||= Post.find params[:id]
  end
end
