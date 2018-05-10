# == Schema Information
#
# Table name: likes
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :integer
#  user_id    :integer
#

class LikeSerializer < ActiveModel::Serializer
  attributes :id
end
