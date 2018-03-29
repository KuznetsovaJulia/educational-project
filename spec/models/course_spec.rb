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
