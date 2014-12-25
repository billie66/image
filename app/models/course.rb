class Course < ActiveRecord::Base
  mount_uploader :cover, :CoverUploader
end
