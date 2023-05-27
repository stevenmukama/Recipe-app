require 'rails_helper'

RSpec.describe 'Food Index', type: :feature do
  before :each do
    user = User.create!(
      name: 'Tom',
      email: 'tom@example.com',
      password: '123456',
    )

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    visit foods_path
  end

  describe 'index page for list foods' do
    it 'shows name of food of the logged-in user.' do
      expect(page).to have_content('Food')
    end


    it 'shows the button add food' do
      expect(page).to have_content('Foods')
    end

  end
end