class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :blog, index: true, foreign_key: true
      t.string :message

      t.timestamps null: false
    end
  end
end
