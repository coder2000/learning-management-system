class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  field :content, type: String
  field :homework, type: Boolean, default: false
  field :quiz, type: Boolean, default: false

  belongs_to :group, class_name: "Group"
  belongs_to :user, class_name: "User"
  belongs_to :video, class_name: "Video"
  has_and_belongs_to_many :attachments, class_name: "Document"
end
