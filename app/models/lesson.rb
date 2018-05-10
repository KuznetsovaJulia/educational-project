# == Schema Information
#
# Table name: lessons
#
#  id          :bigint(8)        not null, primary key
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  section_id  :bigint(8)
#
# Indexes
#
#  index_lessons_on_section_id  (section_id)
#
# Foreign Keys
#
#  fk_rails_...  (section_id => sections.id)
#

class Lesson < ApplicationRecord
  belongs_to :section
  has_many :blocks, dependent: :destroy
  has_many :practices, through: :blocks
end
