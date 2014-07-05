class Image < ActiveRecord::Base
  has_attached_file :image_file, styles: { thumbnail: '469x', gallery: '898x' }, storage: :s3

  belongs_to :imageable, polymorphic: true

  validates :image_file, attachment_presence: true, attachment_content_type: {
      content_type: %w[image/jpg image/jpeg image/gif image/png]
  }
end
