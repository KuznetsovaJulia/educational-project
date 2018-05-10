# == Schema Information
#
# Table name: courses
#
#  id          :bigint(8)        not null, primary key
#  deleted_at  :datetime
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  author_id   :integer
#
# Indexes
#
#  index_courses_on_author_id   (author_id)
#  index_courses_on_deleted_at  (deleted_at)
#

class CourseSerializer < ActiveModel::Serializer
  attributes :id
end
