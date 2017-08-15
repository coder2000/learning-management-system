class RequestsController < ApplicationController
  before_action :admin?, except: [:join]

  def join
    if Group.find_by( token: params[:code] ).present?
      current_user.requests.create(token: params[:code])
      @notice = "Request sent"
    elsif current_user.requests.find_by(token: @code).present?
      @notice = "You already sent a request"
    elsif current_user.member_of.pluck(:id).include?(params[:code])
      @notice = "You're already part of the group"
    else
      @notice = "Group not found"
    end
  end

  def accept
    if rekuest = Request.find_by(user: params[:user_id], token: params[:group_id])
      rekuest.accept
      redirect_to group_path(params[:group_id]), notice: "Student added in the group"
    end
  end

  def show
    @group = Group.find_by_token params[:group_id]
    @requests = Request.where(token: params[:group_id])
  end

  private

  def data
    params.require(:request).permit(:code)
  end

end
