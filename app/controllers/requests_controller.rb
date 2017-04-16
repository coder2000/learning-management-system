class RequestsController < ApplicationController
  before_filter :admin?, except: [:join]
  def join
    code = params[:code] || ""
    if Group.where(token: code).present?
      group = Group.find_by_token(code)
    end
    if !Group.where(token: code).present?
      redirect_to pages_index_path, notice: "Group doesn't exist yet"
    elsif current_user.requests.where(token: code).present?
      redirect_to pages_index_path, notice: "You already sent a request"
    elsif User.where(email: current_user.email, student_of: group.id).present?
      redirect_to pages_index_path, notice: "You're already part of the group"
    else
      current_user.requests.create(token: params[:code])
      redirect_to pages_index_path, notice: "Request Sent"
    end
  end

  def accept
    if User.addGroup(params[:user_id], params[:group_id])
      Request.where(user_id: params[:user_id],token: params[:group_id]).delete
      redirect_to group_path(params[:group_id]),notice: "Student added in the group"
    end
  end

  def show
    @group = Group.find_by_token params[:code]
    @requests = Request.where(token: params[:code])
  end

  private

  def data
    params.require(:request).permit(:code)
  end

end
