class SessionsController < ApplicationController
  before_filter :authenticated?, only: [:destroy]
  before_filter :check_if_logged_in, only: [ :authenticate ]
  def authenticate
   user = login(params[:email], params[:password])
   if user
     redirect_back_or_to(pages_index_path, notice: "Logged in successful")
   else
     redirect_to root_url, notice: "Unknown password/email"
   end
  end
  def destroy
    logout
    redirect_to root_path, notice: "Logged out successfuly"
  end

end

