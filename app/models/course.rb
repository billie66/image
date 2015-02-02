class Course < ActiveRecord::Base
  mount_uploader :cover, CoverUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  after_update :crop_cover

  def cover_name
      self.name ||= File.basename(cover.filename, '.*').titleize if cover
  end

  def crop_cover
    cover.recreate_versions! if crop_x.present?
  end

# mothod to convert base64 image data url to binary image
  def image_data=(data)
    regex = /data:(.*);(.*),/
    realdata = regex.match(data).post_match

    # decode data and create stream on them
    io = CarrierStringIO.new(Base64.decode64(realdata))

    # this will do the thing (avatar is mounted carrierwave uploader)
    self.cover = io
  end
end
