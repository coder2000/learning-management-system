# Sessions controller
class SessionsController < ApplicationController
  before_action :require_login, only: [:destroy]
  before_action :check_if_logged_in, only: [:authenticate]

  def authenticate
    user = login(params[:email], params[:password])
    if user
      redirect_back_or_to(pages_index_path, success: 'Logged in successfully')
    else
      redirect_to root_url, flash: { error: 'Unknown password/email' }
    end
  end

  def destroy
    logout
    redirect_to root_path, flash: { success: 'Logged out successfully' }
  end
end
