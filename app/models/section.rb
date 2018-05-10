# == Schema Information
#
# Table name: sections
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :bigint(8)
#
# Indexes
#
#  index_sections_on_course_id  (course_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#

class Section < ApplicationRecord
  belongs_to :course
  has_many :lessons, dependent: :destroy
  has_many :blocks, through: :lessons
end
