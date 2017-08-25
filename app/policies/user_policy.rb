# User Policy
class UserPolicy < ApplicationPolicy

  def edit?
    @record.id == @user.id
  end

end

