# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
  has_many :categorizations
  has_many :courses, through: :categorizations
  validates_uniqueness_of :name

  def self.names
    pluck(:name)
  end
end
