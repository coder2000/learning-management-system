# User Model
class User
  include Mongoid::Document

  mount_uploader :avatar, AvatarUploader
  authenticates_with_sorcery!
  ALLOWED_ROLES = [1, 2].freeze

  field :first_name, type: String
  field :middle_name, type: String
  field :last_name, type: String
  field :gender, type: String, default: 'male'
  field :role, type: Integer, default: 1

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :password, on: :create, presence: true
  validates :password_confirmation, on: :create, presence: true
  validates :password, confirmation: true, on: :create, presence: true
  # validate :role_allowed

  def full_name
    if last_name.present?
      "#{first_name.titleize} #{last_name.titleize}"
    else
      first_name.titleize
    end
  end

  has_and_belongs_to_many :instructor_of, inverse_of: :instructor,
                                          class_name: 'Group'
  has_and_belongs_to_many :member_of, inverse_of: :member, class_name: 'Group'
  has_many :requests
  has_many :repositories
  has_many :posts, class_name: 'Post'
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
