class RenameBlogIdColumn < ActiveRecord::Migration
  def change
    rename_column(:comments, :blog_id, :post_id)
  end
end
