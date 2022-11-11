require 'rails_helper'

RSpec.describe 'Testing food views', type: :feature do
  describe 'Food#index' do
    before(:each) do
      @user = User.create(name: 'Sid', email: 'sid@test.com', password: '123456789')

      visit new_user_session_path
      fill_in 'Email', with: 'sid@test.com'
      fill_in 'Password', with: '123456789'
      click_button 'Log in'
      visit foods_path
    end

    it 'Render the right contents' do
      expect(page).to have_content 'No food in your list'
    end

    it 'should have an add food button' do
      expect(page).to have_link('Add food')
    end
  end
end
