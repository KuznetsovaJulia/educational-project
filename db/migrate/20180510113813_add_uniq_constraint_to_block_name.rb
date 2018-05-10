class AddUniqConstraintToBlockName < ActiveRecord::Migration[5.1]
  def change
    change_column :blocks, :name, :string, uniq: true, null: false, default: ''
  end
end
