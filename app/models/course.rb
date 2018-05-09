# == Schema Information
#
# Table name: courses
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer
#  deleted_at :datetime
#

class Course < ApplicationRecord
  acts_as_paranoid
  has_many :subscriptions, dependent: :destroy
  has_many :users, through: :subscriptions
  belongs_to :author, class_name: 'User', foreign_key: 'author_id', optional: true
  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations, dependent: :destroy
  has_many :likes
  has_many :sections, dependent: :destroy
  has_many :lessons, through: :sections
  has_many :blocks, through: :lessons
  has_many :practices, through: :blocks

  validates :description, presence: true, length: { minimum: 3 }

  validates :name, presence: true, length: { minimum: 3 }

  class << self
    def find_by_category_name(category_name)
      joins(:categorizations)
        .ransack(categorization_name_cont: category_name)
        .result
    end

    def find_by_category_id(category_id)
      joins(:categorizations)
        .ransack(categorizations_category_id_eq: category_id)
        .result
    end
  end

  def might_be_deleted?
    subscriptions.count > 5
  end

  def category_names
    categories.map(&:name)
  end
end
