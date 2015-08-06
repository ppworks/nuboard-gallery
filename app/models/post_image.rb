class PostImage < ActiveRecord::Base
  belongs_to :post
  mount_uploader :image, PostImageUploader

  validates_presence_of :image
end
