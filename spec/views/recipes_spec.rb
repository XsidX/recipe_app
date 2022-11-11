require 'rails_helper'

RSpec.describe 'Testing recipes view', type: :feature do
  describe 'Recipes#index' do
    before(:each) do
      @user = User.create(name: 'Sid', email: 'sid@test.com', password: '123456789')
      (1..3).each do |i|
        @user.recipes.create name: "Cake #{i}", preparation_time: 20,
                             cooking_time: 90, description: 'Follow these steps', public: true
      end

      visit new_user_session_path
      fill_in 'Email', with: 'sid@test.com'
      fill_in 'Password', with: '123456789'
      click_button 'Log in'
      visit recipes_path
    end

    it 'Check if delete button are displayed' do
      within('body') do
        expect(find_all('button').length).to eq 10
      end
    end
  end
end
