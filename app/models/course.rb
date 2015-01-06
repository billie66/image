class Course < ActiveRecord::Base
  mount_uploader :cover, CoverUploader
  before_create :cover_name

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_cover

  def cover_name
      self.name ||= File.basename(cover.filename, '.*').titleize if cover
  end

  def crop_cover
    cover.recreate_versions! if crop_x.present?
  end
end
