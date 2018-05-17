# == Schema Information
#
# Table name: studies
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :bigint(8)
#  user_id    :bigint(8)
#
# Indexes
#
#  index_studies_on_course_id              (course_id)
#  index_studies_on_course_id_and_user_id  (course_id,user_id) UNIQUE
#  index_studies_on_user_id                (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#  fk_rails_...  (user_id => users.id)
#

class Study < ApplicationRecord
  belongs_to :user
  belongs_to :course
end
