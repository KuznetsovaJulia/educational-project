require 'rails_helper'
describe 'the signin process' do
  before do
    @user = User.create(email: 'user@example.com', password: 'password')
    @user.update(confirmed_at: Time.now)
  end
  it 'if correct password' do
    visit '/users/login'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    expect(page).to have_content('Выйти')
  end
  it 'if incorrect password' do
    visit '/users/login'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: ''
    click_button 'Log in'
    expect(page).to have_content('Forgot your password?')
  end
end
