# == Schema Information
#
# Table name: categorizations
#
#  id          :bigint(8)        not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint(8)
#  course_id   :bigint(8)
#
# Indexes
#
#  index_categorizations_on_category_id  (category_id)
#  index_categorizations_on_course_id    (course_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (course_id => courses.id)
#

class Categorization < ApplicationRecord
  belongs_to :course
  belongs_to :category

  delegate :name, to: :category
end
