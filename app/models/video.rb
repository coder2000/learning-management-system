class Video < Attachment
  include Mongoid::Document

  embedded_in :attachable, polymorphic: true
end
