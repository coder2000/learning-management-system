class UserPolicy < ApplicationPolicy

  def edit?
    return true if @user
  end

end

