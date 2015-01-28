# encoding: utf-8

class CoverUploader < CarrierWave::Uploader::Base
  include UploaderHelper

  include CarrierWave::MimeTypes
  process :set_content_type

  # Include RMagick or MiniMagick support:
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/"
  end

  process :crop

  # Create different versions of your uploaded files:
  version :thumb do
    process :resize_to_fill => [200, 200]
  end

  def crop
    if model.crop_x.present?
      resize_to_fit(300, 300)
      manipulate! do |img|
        x = model.crop_x.to_i
        y = model.crop_y.to_i
        w = model.crop_w.to_i
        h = model.crop_h.to_i
        img.crop("#{w}x#{h}+#{x}+#{y}")
        img
      end
    end
  end
  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
