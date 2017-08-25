# Application controller
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include Pundit

  before_action :require_login

  private

  def check_if_logged_in
    redirect_to pages_index_path if logged_in?
  end

  def admin?
    if current_user.student?
      redirect_to '/404'
    end
  end
end
