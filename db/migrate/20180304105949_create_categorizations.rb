class CreateCategorizations < ActiveRecord::Migration[5.1]
  def change
    create_table :categorizations do |t|
      t.belongs_to :course, foreign_key: true
      t.belongs_to :category, foreign_key: true

      t.timestamps
    end
  end
end
