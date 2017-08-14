class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include Pundit

  before_action :authenticated?

  private

  def authenticated?
    if !logged_in?
      redirect_to root_url
    end
  end

  def check_if_logged_in
    if logged_in?
      redirect_to pages_index_path
    end
  end

  def admin?
    if current_user.student?
      redirect_to pages_index_path, notice: "Unkown URL"
    end
  end
end
