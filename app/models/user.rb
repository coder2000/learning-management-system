class User
  include Mongoid::Document
  include Mongoid::Enum

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
    fname.titleize + " " + lname.titleize
  end

  has_and_belongs_to_many :instructor_of, inverse_of: :instructor, class_name: 'Group'
  has_and_belongs_to_many :student_of, inverse_of: :student, class_name: 'Group'
  has_many :requests
  has_many :video_repositories
  has_many :files, class_name: "Document"
  has_many :posts, class_name: "Post"

  enum :role, [ :student, :admin ]

  def add_group(user, token)
    group = Group.find_by_token(token)
    user = User.find(user)
    user.student_of << group
    group.student << user
  end

  def part_of_the_group?(code)
    if admin?
      return true if instructor_of.pluck(:token).include?(code)
    else
      return true if student_of.pluck(:token).include?(code)
    end
  end

end
