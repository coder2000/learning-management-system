class Group

  attr_accessor :user

  include Mongoid::Document
  include Mongoid::Token

  after_create :add_user_to_group

  field :title, type: String
  field :description, type: String


  validates :title, presence: true

  token length: 6

  has_and_belongs_to_many :instructor, inverse_of: :instructor_of, class_name: 'User'
  has_and_belongs_to_many :members, inverse_of: :member_of, class_name: 'User'
  has_many :posts, class_name: "Post"

  def remove_member(user)
    user.member_of.delete(self)
    self.members.delete(user)
  end

  def add_user_to_group
    instructor << user
    members << user
    user.instructor_of << self
    user.member_of << self
  end
end
