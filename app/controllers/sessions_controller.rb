# Sessions controller
class SessionsController < ApplicationController
  before_action :require_login, only: [:destroy]
  before_action :check_if_logged_in, only: [:authenticate]

  def authenticate
    user = login(params[:email], params[:password])
    if user
      redirect_back_or_to(pages_index_path, notice: 'Logged in successful')
    else
      redirect_to root_url, notice: 'Unknown password/email'
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'Logged out successfully'
  end
end
