class Lesson < ApplicationRecord
  belongs_to :section
  has_many :blocks, dependent: :destroy
end
