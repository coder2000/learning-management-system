class Attachment
  include Mongoid::Document

  embeds_many :attachments, as: :attachable
end
