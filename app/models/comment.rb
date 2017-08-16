class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :content, type: String

  belongs_to :user, inverse_of: :comments
  belongs_to :post, inverse_of: :comments

  validates :content, presence: true
  validates :user, presence: true

  def owner?(author_id)
    user.id == author_id
  end

end
