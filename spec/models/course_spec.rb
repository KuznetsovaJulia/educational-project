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

require 'rails_helper'

RSpec.describe Course do
  let(:test_course) { Course.new(name: 'Example') }
  it 'should be valid' do
    expect(test_course).to respond_to(:name)
  end
  it { should have_many :users }
  it 'should be valid' do
    expect(test_course).to respond_to(:author)
  end
  it { should belong_to :author }
end
