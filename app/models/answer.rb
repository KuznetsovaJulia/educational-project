# == Schema Information
#
# Table name: answers
#
#  id          :bigint(8)        not null, primary key
#  content     :string
#  correct     :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  practice_id :bigint(8)
#
# Indexes
#
#  index_answers_on_practice_id  (practice_id)
#
# Foreign Keys
#
#  fk_rails_...  (practice_id => practices.id)
#

class Answer < ApplicationRecord
    belongs_to :practice
end
