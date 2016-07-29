class Video
  include Mongoid::Document
  mount_uploader :video, VideoUploader

  field :title, type: String

  belongs_to :video_repository
  has_many :posts, class_name: "Post"

  validates_presence_of :video

  before_save :set_title


  def set_title
    self.title ||= File.basename(video.filename , '.*').titleize if video
  end
end
