class GroupsController < ApplicationController
  before_filter :part_of_the_group?, except: [:create, :index]
  before_filter :group, only: [:show]
  def index
  end
  def create
    if current_user.role != 'student'
      if @group = Group.create!(data)
        @group.instructor << current_user
        current_user.instructor_of << @group
        redirect_to group_path(@group.token), notice: "Group Created"
      else
        redirect_to pages_index_path, notice: "Something went wrong"
      end
    else
      redirect_to pages_index_path, notice: "Something went wrong"
    end
  end

  def show
    @post = @group.posts.desc(:updated_at).page(params[:page])
  end

  private

  def group
    @group ||= Group.find_by_token params[:id]
  end

  def data
    params.require(:group).permit(:title, :description)
  end

  def part_of_the_group?
    group = Group.find_by_token(params[:id])
    if current_user.role == 'student'
      if !User.where(email: current_user.email, student_of_ids: group.id).present?
        redirect_to pages_index_path, notice: "Unknown URL"
      end
    else
      if !User.where(email: current_user.email, instructor_of_ids: group.id).present?
        redirect_to pages_index_path, notice: "Unknown URL"
      end
    end
  end
end
