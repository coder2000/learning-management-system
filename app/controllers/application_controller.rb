class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  
  def authenticated?
    if !current_user.present?
      redirect_to root_url
    end
  end

  def admin?
    if current_user.role == 'student'
      redirect_to pages_index_path, notice: "Unkown URL"
    end
  end
end
