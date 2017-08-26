# Repository Model
class Repository
  include Mongoid::Document

  field :title, type: String

  validates :title, presence: true

  has_many :records
  belongs_to :user

  def owner?(owner_id)
    user.id == owner_id
  end
end
