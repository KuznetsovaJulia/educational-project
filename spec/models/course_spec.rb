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
