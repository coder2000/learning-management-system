class UsersController < ApplicationController
  before_filter :check_if_logged_in, only: [:new, :create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(data)
    if @user.save
      redirect_to root_url, notice: "You have been successfuly registered"
    else
      redirect_to new_user_path(data[:role]), notice: "Something went wrong"
    end
  end

  def edit
    authorize current_user, :edit?
  end

  def update
    if current_user.update_attributes(permitted_attributes(current_user))
      redirect_to edit_user_path(current_user.id), notice: "Updated successfuly"
    else
      redirect_to edit_user_path(current_user.id), notice: "Something went wrong"
    end
  end


  private

  def update_data
    params.require(:user).permit(:fname,
                                 :mname,
                                 :lname,
                                 :gender)
  end

  def data
    params.require(:user).permit(:email,
                                 :fname,
                                 :mname,
                                 :lname,
                                 :password,
                                 :password_confirmation,
                                 :role,
                                 :gender)
  end
end
