class CommentsController < ApplicationController

  before_action :post

  def create
    @comment = @post.comments.create(data.merge(user: current_user))
  end

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy!
  end

  def edit
    @comment = Comment.find_by id: params[:id]
  end

  def update
    @comment = Comment.find_by id: params[:id]
    @comment.update(data)
  end

  private

  def data
    params.require(:comment).permit(:content, :post_id, :group_id)
  end

  def post
    @post = Post.find params[:post_id]
  end

end
