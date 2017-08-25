# Group Policy
class GroupPolicy < ApplicationPolicy

  def show?
    @user.part_of_the_group?(@record.token)
  end

  def update?
    @user.instructor_of?(@record.token)
  end
end

