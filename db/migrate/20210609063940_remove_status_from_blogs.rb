class RemoveStatusFromBlogs < ActiveRecord::Migration[6.1]
  def change
    remove_column :blogs, :hoge, :int
  end
end
