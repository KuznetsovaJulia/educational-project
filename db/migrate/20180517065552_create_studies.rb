class CreateStudies < ActiveRecord::Migration[5.1]
  def change
    create_table :studies do |t|
      t.references :user, foreign_key: true
      t.references :course,  foreign_key: true

      t.timestamps
    end
    add_index :studies, [:course_id, :user_id], unique: true
  end
end
