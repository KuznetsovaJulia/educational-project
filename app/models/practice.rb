# == Schema Information
#
# Table name: practices
#
#  id          :bigint(8)        not null, primary key
#  answer_type :string           default(NULL), not null
#  question    :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  block_id    :bigint(8)
#
# Indexes
#
#  index_practices_on_block_id  (block_id)
#
# Foreign Keys
#
#  fk_rails_...  (block_id => blocks.id)
#

class Practice < ApplicationRecord
  belongs_to :block
  enum answer_type: {
          multiple_choice: 'multiple_choice',
          one_true: 'one_true',
          sequence: 'sequence',
          collation: 'collation',
          write_text: 'write_text',
          write_number: 'write_number'
  }
has_many :answers, dependent: :destroy
end
