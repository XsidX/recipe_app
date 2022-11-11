require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'Recipe model' do
    before(:each) do
      @user = User.create(name: 'Sid', email: 'sid@test.com', password: '123456789')
    end

    it 'Check recipe name' do
      recipe = Recipe.create name: 'Sambusa', cooking_time: 5,
                             preparation_time: 60, description: 'Samusa is a well known',
                             public: true, user: @user
      expect(recipe.name).to eql('Sambusa')
    end

    it 'Should have a name' do
      recipe = Recipe.create name: '', cooking_time: 5, preparation_time: 60, description: 'Samusa is a well known',
                             public: true, user: @user
      expect(recipe).to_not be_valid
    end
  end
end
