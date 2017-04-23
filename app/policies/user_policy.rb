class UserPolicy < ApplicationPolicy

  def edit?
    return true if @user
  end

  def permitted_attributes_for_update
    [:fname,
     :mname,
     :lname,
     :gender]
  end

end

