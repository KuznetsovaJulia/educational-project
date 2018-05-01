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

class CourseSerializer < ActiveModel::Serializer
  attributes :id
end
