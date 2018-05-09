# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  admin                  :boolean          default(FALSE)
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :subscriptions, dependent: :destroy
  has_many :courses, through: :subscriptions
  has_many :likes

  def likes?(course)
    course.likes.where(user_id: id).any?
  end

  def courses
    Course.where(author_id: id)
  end

  def subscriptions
    Subscription.where(user_id: id)
  end

  def create_course(name, description)
    Course.create(name: name, author_id: id, description: description)
  end

  def subscribe(course)
    Subscription.create(course_id: course.id, user_id: id)
  end
end
