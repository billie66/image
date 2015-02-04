class RenameCoverInCourses < ActiveRecord::Migration
  def change
    rename_column :courses, :cover, :avatar
  end
end
