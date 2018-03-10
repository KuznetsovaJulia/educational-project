class Course < ApplicationRecord
    acts_as_paranoid
    has_many :subscriptions, dependent: :destroy
    has_many :users, through: :subscriptions
    belongs_to :author, :class_name => 'User', :foreign_key => 'author_id', optional: true
    has_many :categorization, dependent: :destroy
    has_many :categories, through: :categorization, dependent: :destroy
end
