class Post < ActiveRecord::Base
  belongs_to :user
  has_many :post_images, -> { order('id ASC') }
  accepts_nested_attributes_for :post_images
end
