class Post < ActiveRecord::Base
  belongs_to :user
  has_many :post_images, -> { order('id ASC') }
end
