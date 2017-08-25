# Users controller
class UsersController < ApplicationController
  before_action :check_if_logged_in, only: %i[new create]
  skip_before_action :authenticated?, only: %i[new create]

  def new
    @user = User.new(role: params[:role])
  end

  def create
    if User.create(data)
      redirect_to root_url, notice: 'You have been successfully registered'
    else
      redirect_to new_user_path(data[:role]), notice: 'Something went wrong'
    end
  end

  def edit
    @user = User.find params[:id]
    authorize @user, :edit?
  end

  def update
    if current_user.update_attributes(permitted_attributes(current_user))
      redirect_to edit_user_path(current_user.id),
                  notice: 'Updated successfully'
    else
      redirect_to edit_user_path(current_user.id),
                  notice: 'Something went wrong'
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
