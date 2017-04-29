class Repository
  include Mongoid::Document

  field :title, type: String

  def videos
    lambda { where('records.file_type = video AND repository_id = ?', repository) }
  end

  validates_presence_of :title

  has_many :records
  belongs_to :user
end
