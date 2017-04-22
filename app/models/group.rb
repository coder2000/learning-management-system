class Group
  include Mongoid::Document
  include Mongoid::Token

  field :title, type: String
  field :description, type: String

  validates_presence_of :title

  token length: 6

  has_and_belongs_to_many :instructor, inverse_of: :instructor_of, class_name: 'User'
  has_and_belongs_to_many :student, inverse_of: :student_of, class_name: 'User'
  has_many :posts, class_name: "Post"

end
