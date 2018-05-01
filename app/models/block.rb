class Block < ApplicationRecord
  belongs_to :lesson
  has_many :practices, dependent: :destroy
end
