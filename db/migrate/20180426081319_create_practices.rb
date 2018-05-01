class CreatePractices < ActiveRecord::Migration[5.1]
  def change
    create_table :practices do |t|
      t.references :block, foreign_key: true

      t.timestamps
    end
  end
end
