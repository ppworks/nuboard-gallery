class Post < ActiveRecord::Base
  belongs_to :user
  has_many :post_images, -> { order('id ASC') }
  accepts_nested_attributes_for :post_images
  before_create :set_hash_key

  validates_uniqueness_of :hash_key

  class << self
    def generate_token(column_name)
      loop do
        token = SecureRandom.hex
        break token unless Post.where("#{column_name} = ?", token).first
      end
    end
  end

  private
  def set_hash_key
    self.hash_key = Post.generate_token(:hash_key)
  end
end
