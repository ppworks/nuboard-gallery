class User < ActiveRecord::Base
  include Storable
  storable_file :image
  devise :rememberable, :trackable, :omniauthable

  has_many :connections, dependent: :delete_all

  validates :email, email_format: {allow_nil: true}
  validates :unconfirmed_email, email_format: {allow_nil: true}
  validates_uniqueness_of :email, allow_blank: true


  class << self
    def authentication(auth_hash, current_user = nil)
      begin
        params = {
          provider: auth_hash['provider'],
          uid: auth_hash['uid'],
          name: auth_hash['info']['name'],
          nickname: auth_hash['info']['nickname'],
          image: auth_hash['info']['image'],
          access_token: auth_hash['credentials']['token'],
          secret_token: auth_hash['credentials']['secret'],
        }
      rescue => e
        return nil
      end
      params[:image].gsub!(/_normal/, '_bigger') if params[:provider] == 'twitter'

      connection = Connection.where(provider: params[:provider], uid: params[:uid]).first_or_initialize
      user = current_user ? current_user : connection.user
      user = User.create(nickname: params[:nickname]) unless user
      user.tap do |u|
        u.name = params[:name]
        u.image = params[:image]
        u.save
        u.save_to_s3(true)
      end

      params[:user] = user
      connection.update_attributes(params)

      if user.email_key.blank?
        user.update_column(:email_key, generate_token(:email_key))
      end

      return user
    end

    private
    def generate_token(column_name)
      loop do
        token = Devise.friendly_token.gsub(/-/,'_')
        break token unless User.where("#{column_name} = ?", token).first
      end
    end
  end

  def me?(user)
    return self.id == user.try(:id)
  end

  def update_email(email)
    self.unconfirmed_email = email
    self.confirm_limit_at = Time.current + 3.hour
    self.hash_to_confirm_email = confirm_key
    if self.save
      UserMailer.email_confirmation(self).deliver
    else
      return false
    end
  end

  def confirm_email(hash)
    if hash == self.hash_to_confirm_email && Time.current <= self.confirm_limit_at
      self.email = self.unconfirmed_email
      self.unconfirmed_email = nil
      self.confirm_limit_at = nil
      self.hash_to_confirm_email = nil
      self.save
    end
  end

  def nickname=(value)
    @nickname = value
  end

  def nickname
    return @nickname if @nickname
    @nickname = self.connections.last ? self.connections.last.nickname : self.name
  end

  def create_thumbnail(bucket, path_to_save, save_file)
    image = MiniMagick::Image.open(save_file)
    image.resize "20x20"
    image.quality 50
    bucket.files.create(key: path_to_save + "-20x20", public: true, body: image.to_blob)
  end

  def thumbnail_image
    "#{image}-20x20"
  end

  def image
    super
  end

  def image_with_cut_scheme
    self.image_without_cut_scheme.sub(/http(s)?:/, '') if self.image_without_cut_scheme.present?
  end
  alias_method_chain :image, :cut_scheme

  private
  def confirm_key
    Digest::SHA1.hexdigest("#{self.id}#{Time.current.to_i}")
  end
end
