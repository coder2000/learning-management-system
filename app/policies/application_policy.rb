class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    raise Pundit::NotAuthotizedError, 'must be logged in' unless user
    @user = user
    @record = record
  end

  def create?
    true if @user.admin?
  end

  def delete?
    true if @user.admin? || @record.owner?(@user)
  end
end
