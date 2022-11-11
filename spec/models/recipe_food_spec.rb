require 'rails_helper'

RSpec.describe 'RecipeFoods', type: :model do
  describe 'recipe_foods model' do
    subject do
      @user = User.create(name: 'Sid', email: 'sid@test.com', password: '123456789')
      Food.create(name: 'Kenyan CApati', measurement_unit: 'unit', price: 4, quantity: 100, user: @user)
    end
    before { subject.save }

    it 'should have name' do
      expect(subject.name).to eql('Kenyan CApati')
    end

    it 'should check that the measurement_unit is not blank' do
      subject.measurement_unit = nil
      expect(subject).to_not be_valid
    end

    it 'should have a price' do
      expect(subject.price).to eql(4)
    end
  end
end