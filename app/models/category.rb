class Category < ApplicationRecord
  has_many :categorizations
  has_many :courses, through: :categorizations
end
