class Lesson < ApplicationRecord
  belongs_to :section
  has_many :blocks, dependent: :destroy
  has_many :practices, through: :blocks
end
