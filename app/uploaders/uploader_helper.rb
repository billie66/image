require 'digest'
require 'carrierwave/processing/mime_types'

module UploaderHelper
  def cache_dir
    "/tmp"
  end

  def filename
    if original_filename.present?
      #if model && model.read_attribute(mounted_as).present?
        #model.read_attribute(mounted_as)
      #else
        hashed_name = Digest::MD5.hexdigest(File.dirname(current_path))[5..15]
        "#{hashed_name}.png"
      #end
    end
  end
end
