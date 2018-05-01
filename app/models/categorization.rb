# == Schema Information
#
# Table name: categorizations
#
#  id          :integer          not null, primary key
#  course_id   :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Categorization < ApplicationRecord
  belongs_to :course
  belongs_to :category

  delegate :name, to: :category
end
