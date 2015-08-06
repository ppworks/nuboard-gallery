class PostImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  process :fix_rotate

  def fix_rotate
    manipulate! do |img|
      img.auto_orient
      yield(img) if block_given?
      img
    end
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Create different versions of your uploaded files:
  version :thumb do
    process resize_to_limit: [720, 720]
  end

  def extension_white_list
     %w(jpg jpeg gif png)
  end

  def md5
    chunk = model.send(mounted_as)
    @md5 ||= Digest::MD5.hexdigest(chunk.read.to_s)
  end

  def filename
    if original_filename
      if model && model.read_attribute(mounted_as).present?
        model.read_attribute(mounted_as)
      else
        @name ||= "#{md5}#{File.extname(super)}" if super
      end
    end
  end
end
