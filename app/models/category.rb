class Category < ApplicationRecord
    has_many :categorization
    has_many :courses, through: :categorization
end
