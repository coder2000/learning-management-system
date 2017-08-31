# Groups controller
class GroupsController < ApplicationController
  before_action :group, only: [:show]

  layout 'application', except: [:index]

  def index; end

  def create
    authorize Group.new, :create?
    @group = Group.new data.merge!(user: current_user)
    if @group.save!
      @group.instructor << user
      @group.members << user
      current_user.instructor_of << @group
      current_user.member_of <<  @group
      redirect_to group_path(@group.token), flash: { success: 'Group Created' }
    else
      redirect_to pages_index_path, flash: { error: 'Something went wrong' }
    end
  end

  def members
    @group = Group.find_by_token params[:group_id]
    @members = @group.members
  end

  def remove_member
    @group = Group.find_by_token params[:group_id]
    user = User.find_by id: params[:user_id]
    if @group.remove_member(user).nil?
      render json: { message: 'User has been removed from the group' },
             status: 200
    else
      render json: { message: 'Something went wrong' }, status: 500
    end
  end

  def show
    @posts = @group.posts.desc(:updated_at).page(params[:page]).per(6)

    authorize @group, :show?

    respond_to do |format|
      format.js { @posts }
      format.html { @posts }
    end
  end

  private

  def group
    @group ||= Group.find_by_token(params[:id])
  end

  def data
    params.require(:group).permit(:title, :description)
  end
end
