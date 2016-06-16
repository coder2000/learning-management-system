class Document
  include Mongoid::Document
  mount_uploader :files, FileUploader

  field :title, type: String

  before_save :set_title

  belongs_to :user, class_name: "User"

  def set_title
    self.title ||= File.basename(files.filename , '.*').titleize if files
  end
end
