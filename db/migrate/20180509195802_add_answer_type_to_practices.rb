class AddAnswerTypeToPractices < ActiveRecord::Migration[5.1]
  def change
    add_column :practices, :answer_type, :integer
  end
end
