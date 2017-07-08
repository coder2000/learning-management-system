class RepositoryPolicy < ApplicationPolicy

  def index?
    return true if @user.admin?
  end

  def show?
    return true if @record.owner?(@user.id)
  end
end

