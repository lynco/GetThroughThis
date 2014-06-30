class Image < ActiveRecord::Base
  has_attached_file :image_file, styles: { thumbnail: '469x', gallery: '898x' }
  belongs_to :imageable, polymorphic: true
end
