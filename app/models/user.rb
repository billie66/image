class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  after_update :crop_avatar

  def crop_avatar
    avatar.recreate_versions!(:thumb) if crop_x.present?
  end

# mothod to convert base64 image data url to binary image
  def image_data=(data)
    regex = /data:(.*);(.*),/
    realdata = regex.match(data).post_match

    # decode data and create stream on them
    io = CarrierStringIO.new(Base64.decode64(realdata))

    self.avatar = io
  end
end
