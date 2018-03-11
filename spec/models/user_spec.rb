require 'rails_helper'
RSpec.describe User do
    before do
        @user =  User.create(email: 'user@example.com', password: 'password')
        @user.update(confirmed_at: Time.now)
    end
    it 'should be valid' do
        expect(@user).to respond_to(:email)
    end
    it {should have_many :courses}
    it {should have_many :subscription}
end