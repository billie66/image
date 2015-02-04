class RenameCoursesToUsers < ActiveRecord::Migration
  def change
    rename_table :courses, :users
  end
end
