# Application controller
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include Pundit

  before_action :authenticated?

  private

  def authenticated?
    redirect_to root_url unless logged_in?
  end

  def check_if_logged_in
    redirect_to pages_index_path if logged_in?
  end

  def admin?
    redirect_to pages_index_path, notice: 'Unknown URL' if current_user.student?
  end
end
