class Course < ActiveRecord::Base
  mount_uploader :cover, CoverUploader
  before_create :cover_name

  def cover_name
      self.name ||= File.basename(cover.filename, '.*').titleize if cover
  end
end
