class AddBlogColumnToComments < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :blog, null: false, foreign_key: true
  end
end
