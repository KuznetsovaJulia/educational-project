class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable
  has_many :subscription, dependent: :destroy
  has_many :courses, through: :subscription
  has_many :likes
  def likes?(course)
    course.likes.where(user_id:id).any?
  end
  def  courses
    Course.where(author_id: id)
  end
  def  subscriptions
    Subscription.where(user_id: id)
  end
end
