class Category < ApplicationRecord

  has_many :categorizations
  has_many :courses, through: :categorizations
  validates_uniqueness_of :name

  def self.names
    pluck(:name)
  end
end
