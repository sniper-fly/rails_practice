class RenameHeyToBlogs < ActiveRecord::Migration[6.1]
  def change
    rename_column :blogs, :hey, :yeah
  end
end
