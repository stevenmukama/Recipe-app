require 'rails_helper'
RSpec.describe 'Recipes Index', type: :feature do
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
    visit recipes_path
  end

  describe 'index page for list of recipes' do
    it 'shows  list of recipes.' do
      expect(page).to have_content('Recipes')
    end

    it 'should be able to see delete button for each recipe' do
      within('body') do
        expect(find_all('button'))
      end
    end

    it 'shows the button to add recipies' do
      expect(page).to have_content('New recipe')
    end
  end
end