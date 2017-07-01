class CommentsController < ApplicationController

  before_filter :post

  def create
    @comment = @post.comments.create(data.merge(user: current_user))
  end

  private

  def data
    params.require(:comment).permit(:content, :post_id, :group_id)
  end

  def post
    @post = Post.find params[:post_id]
  end

end
