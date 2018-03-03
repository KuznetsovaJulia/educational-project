class Course < ApplicationRecord
    has_many :subscriptions, dependent: :destroy
    has_many :users, through: :subscriptions
    belongs_to :author, :class_name => 'User', :foreign_key => 'author_id', optional: true
end
