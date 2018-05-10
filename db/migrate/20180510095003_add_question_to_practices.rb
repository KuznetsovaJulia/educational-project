class AddQuestionToPractices < ActiveRecord::Migration[5.1]
  def change
    add_column :practices, :question, :text
  end
end
