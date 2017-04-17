class PagesController < ApplicationController
  layout 'application', except: [:login]
  before_filter :check_if_logged_in, only: [:login]
  def login
  end

  def index
    if current_user.admin?
      @posts =  current_user.instructor_of.collect(&:posts).flatten
      @posts = @posts.sort { |x, y| y.created_at <=> x.created_at }
      @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(3)
    else
      @posts =  current_user.student_of.collect(&:posts).flatten
      @posts = @posts.sort { |x, y| y.created_at <=> x.created_at }
      @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(3)
    end

    respond_to do |format|
      format.html { @posts }
      format.js { @posts }
    end
  end

end

