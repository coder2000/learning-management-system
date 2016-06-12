class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(data)
    if @user.save
      redirect_to root_url, notice: "You have been successfuly registered"
    else
      redirect_to new_user_path(@user.role), notice: "Something went wrong"
    end
  end

  def edit
    @user = current_user
  end

  def update
    if current_user.update_attributes(update_data)
      redirect_to edit_user_path(current_user.id), notice: "Update successfuly"
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
