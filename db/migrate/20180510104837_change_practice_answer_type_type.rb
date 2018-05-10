class ChangePracticeAnswerTypeType < ActiveRecord::Migration[5.1]
  def change
    change_column :practices, :answer_type, :string, null: false, default: ''
  end
end
