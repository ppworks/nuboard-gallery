require 'open-uri'
module Storable
  extend ActiveSupport::Concern

  included do
    class_attribute :storable_file_column
    self.storable_file_column = 'image'
  end

  module ClassMethods
    def storable_file(name)
      storable_file_column = name
    end
  end

  def save_to_s3(force = false)
    return if !force && !image_content_changed?
    return unless ENV['AWS_ACCESS_KEY_ID']
    storage = Fog::Storage.new(
      provider: 'AWS',
      aws_access_key_id:Figaro.env.aws_access_key_id,
      aws_secret_access_key:Figaro.env.aws_secret_access_key,
      region: Figaro.env.aws_region
    )
    bucket = storage.directories.get(Figaro.env.aws_s3_bucket)
    bucket = storage.directories.create(key: Figaro.env.aws_s3_bucket) unless bucket

    save_file = self.send(storable_file_column)
    save_file = "https:#{save_file}" if save_file.match /\A\/\//

    dir = self.class.to_s.tableize
    path_to_save = "#{dir}/#{self.storable_file_column.to_s}/#{self.try(:id)||0 % 1000}/#{self.try(:id)}#{Time.current.to_i}"

    file = bucket.files.create(key: path_to_save, public: true, body: open(save_file))
    create_thumbnail(bucket, path_to_save, save_file)

    storable_url = "#{ENV['CDN_HOST']}/#{path_to_save}"
    self.update_column(self.storable_file_column, storable_url)
  rescue => e
    Bugsnag.notify(e) if Rails.env.production?
  end

  def image_content_changed?
    new_file = self.send(storable_file_column)
    old_file = self.send("#{storable_file_column}_was")
    return true unless old_file
    return true unless Digest::MD5.hexdigest(open(new_file).read) == Digest::MD5.hexdigest(open(old_file).read)
  rescue
    return true
  else
    self[storable_file_column] = old_file
    return false
  end

  def create_thumbnail(bucket, path_to_save, save_file)
  end
end
