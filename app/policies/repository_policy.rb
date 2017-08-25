# Repository Policy
class RepositoryPolicy < ApplicationPolicy

  def index?
    @user.admin?
  end

  def show?
    @record.owner?(@user.id)
  end
end

