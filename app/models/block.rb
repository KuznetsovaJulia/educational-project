# == Schema Information
#
# Table name: blocks
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  theory     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  lesson_id  :bigint(8)
#
# Indexes
#
#  index_blocks_on_lesson_id  (lesson_id)
#
# Foreign Keys
#
#  fk_rails_...  (lesson_id => lessons.id)
#

class Block < ApplicationRecord
  belongs_to :lesson
  has_many :practices, dependent: :destroy
end
