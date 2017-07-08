class Repository
  include Mongoid::Document

  field :title, type: String

  validates_presence_of :title

  has_many :records
  belongs_to :user

  def owner?(owner_id)
    user.id == owner_id
  end
end
