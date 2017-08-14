class RequestsController < ApplicationController
  before_action :admin?, except: [:join]

  def join
    code ||= params[:code]
    if Group.where(token: code).present?
      group = Group.find_by_token(code)
    end
    if !Group.where(token: code).present?
      @notice = "Group doesn't exist yet"
    elsif current_user.requests.where(token: code).present?
      @notice = "You already sent a request"
    elsif current_user.member_of.pluck(:id).include?(params[:code])
      @notice = "You're already part of the group"
    else
      current_user.requests.create(token: params[:code])
      @notice = "Request sent"
    end
  end

  def accept
    if rekuest = Request.find_by(user: params[:user_id], token: params[:group_id])
      rekuest.accept
      redirect_to group_path(params[:group_id]), notice: "Student added in the group"
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
