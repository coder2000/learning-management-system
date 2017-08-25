class Request
  include Mongoid::Document

  field :token, type: String

  belongs_to :user
  accepts_nested_attributes_for :user

  def accept
    group = Group.find_by_token token
    user.member_of << group
    group.members << user
    delete
  end
end
