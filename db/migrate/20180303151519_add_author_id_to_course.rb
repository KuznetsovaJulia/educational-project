class AddAuthorIdToCourse < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :author_id, :integer
    add_index :courses, :author_id
  end
end
