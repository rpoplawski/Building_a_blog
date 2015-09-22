class AddDefaultToPublishedColumn < ActiveRecord::Migration
  def change
    change_column_default(:blogs, :published, 'false')
  end
end
