class User
  include Mongoid::Document

  mount_uploader :avatar, AvatarUploader
  authenticates_with_sorcery!
  ALLOWED_ROLES = [1, 2]

  field :fname, type: String
  field :mname, type: String
  field :lname, type: String
  field :gender, type: String, default: "male"
  field :role, type: Integer, default: 1

  validates_presence_of :email
  validates_presence_of :fname
  validates_presence_of :password, on: :create
  validates_presence_of :password_confirmation, on: :create
  validates_confirmation_of :password, on: :create
  validates :password, confirmation: true, on: :create
  validates_uniqueness_of :email
  #validate :role_allowed

  def fullname
    lname.present? ? "#{ fname.titleize } #{ lname.titleize }" : fname.titleize
  end

  has_and_belongs_to_many :instructor_of, inverse_of: :instructor, class_name: 'Group'
  has_and_belongs_to_many :member_of, inverse_of: :member, class_name: 'Group'
  has_many :requests
  has_many :repositories
  has_many :posts, class_name: "Post"
  has_many :comments, inverse_of: :user

  def self.add_group(user, token)
    group = Group.find_by_token(token)
    user = User.find(user)
    user.member_of << group
    group.student << user
  end

  def part_of_the_group?(code)
    member_of.pluck(:token).include?(code) ? true : false
  end

  def instructor_of?(code)
    instructor_of.pluck(:token).include?(code) ? true : false
  end

  def admin?
    role == 2
  end

  def student?
    role == 1
  end
end
