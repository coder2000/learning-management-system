class VideoRepository
  include Mongoid::Document

  field :title, type: String

  belongs_to :user
  has_many :videos
  accepts_nested_attributes_for :videos, allow_destroy: true
end
