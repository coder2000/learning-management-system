# Comments controller
class CommentsController < ApplicationController

  before_action :post

  def create
    @comment = @post.comments.create(data.merge(user: current_user))
  end

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy!
  end

  private

  def data
    params.require(:comment).permit(:content, :post_id, :group_id)
  end

  def post
    @post = Post.find params[:post_id]
  end

end
