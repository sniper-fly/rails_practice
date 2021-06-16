class AddHogeToBlogs < ActiveRecord::Migration[6.1]
  def change
    add_column :blogs, :hoge, :integer
  end
end
