class Categorization < ApplicationRecord
  belongs_to :course
  belongs_to :category

  delegate :name, to: :category
end
