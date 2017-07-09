class GroupPolicy < ApplicationPolicy

  def show?
    return true if @user.part_of_the_group?(@record.token)
  end

  def permitted_attributes_for_create
    [:title, :description]
  end

end

