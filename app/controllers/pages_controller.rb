class PagesController < ApplicationController
  layout 'application', except: [:login]
  before_action :check_if_logged_in, only: [:login]
  skip_before_action :authenticated?, only: [:login]
  def login
  end

  def index
    @posts =  current_user.member_of.collect(&:posts).flatten
    @posts = @posts.sort { |x, y| y.created_at <=> x.created_at }
    @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(3)

    respond_to do |format|
      format.html { @posts }
      format.js { @posts }
    end
  end

end

