class GroupsController < ApplicationController

  before_filter :group, only: [:show]

  def index
  end

  def create
    authorize Group.new, :create?
    @group = Group.create! permitted_attributes(Group.new)
    @group.instructor << current_user
    current_user.instructor_of << @group
    redirect_to group_path(@group.token), notice: "Group Created"
  end

  def show
    @posts = @group.posts.desc(:updated_at).page(params[:page]).per(3)

    authorize @group, :show?

    respond_to do |format|
      format.js { @posts }
      format.html { @posts }
    end
  end

  private

  def group
    @group ||= Group.find_by_token params[:id]
  end

  def data
    params.require(:group).permit(:title, :description)
  end

end

