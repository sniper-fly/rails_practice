class AddHeyToBlogs < ActiveRecord::Migration[6.1]
  def change
    add_column :blogs, :hey, :int
  end
end
