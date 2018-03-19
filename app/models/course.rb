class Course < ApplicationRecord
    acts_as_paranoid
    has_many :subscriptions, dependent: :destroy
    has_many :users, through: :subscriptions
    belongs_to :author, :class_name => 'User', :foreign_key => 'author_id', optional: true
    has_many :categorization, dependent: :destroy
    has_many :categories, through: :categorization, dependent: :destroy
    validates :name, presence: true, length: { minimum: 3 }
    has_many :likes
    def might_be_deleted?
        subscriptions.count>5
    end
end
