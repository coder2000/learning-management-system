class GroupsController < ApplicationController

  before_filter :group, only: [:show]

  layout 'application', except: [ :index ]

  def index
  end

  def create
    authorize Group.new, :create?
    @group = Group.new data
    if @group.save
      @group.instructor << current_user
      @group.members << current_user
      current_user.instructor_of << @group
      current_user.member_of    <<  @group
      redirect_to group_path(@group.token), notice: "Group Created"
    else
      redirect_to pages_index_path, notice: "Something went wrong"
    end
  end

  def members
    @group = Group.find_by_token params[:group_id]
    @members = @group.members
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
    @group ||= Group.find_by_token( params[:id] )
  end

  def data
    params.require(:group).permit(:title, :description)
  end

end

