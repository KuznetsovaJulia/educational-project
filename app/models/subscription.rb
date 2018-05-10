# == Schema Information
#
# Table name: subscriptions
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :bigint(8)
#  user_id    :bigint(8)
#
# Indexes
#
#  index_subscriptions_on_course_id  (course_id)
#  index_subscriptions_on_user_id    (user_id)
#

class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :course
end
