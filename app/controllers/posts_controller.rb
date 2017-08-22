class PostsController < ApplicationController
  before_action  :group, only: [:show, :create]
  before_action :post, only: [:show, :destroy]
  def show
    if @post.nil?
      redirect_to '/404'
    end
  end
  def create
    @post = @group.posts.create(data.merge! user: current_user )
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

  def destroy
    if @post.destroy
      render json: { message: "Post deleted" }, status: 200
    else
      render json: { message: "Something went wrong" }, status: 500 
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
