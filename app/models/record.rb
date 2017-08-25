class Record
  include Mongoid::Document

  mount_uploader :record_file, FileUploader

  field :title, type: String
  field :file_type, type: String

  belongs_to :repository

  before_save :set_title
  before_save :set_file_type

  def set_title
    self.title ||= File.basename(record_file.filename, '.*').titleize if record_file
  end

  def set_file_type
    self.file_type = record_file.content_type.starts_with?('video') ? 'video' : 'application'
  end
end
