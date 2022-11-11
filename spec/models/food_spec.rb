require 'rails_helper'

RSpec.describe Food, type: :model do
  subject do
    @user = User.create(name: 'Sid', email: 'sid@test.com', password: '123456789')
    Food.create(name: 'Kenyan CApati', measurement_unit: 'unit', price: 3, quantity: 100, user: @user)
  end

  before(:each) { subject.save }

  it 'belongs to a user' do
    food = Food.reflect_on_association('user')
    expect(food.macro).to eq(:belongs_to)
  end

  it 'should have name' do
    expect(subject.name).to eql('Kenyan CApati')
  end

  it 'should have an measurement unit' do
    expect(subject.measurement_unit).to eql('unit')
  end

  it 'should have a price' do
    expect(subject.price).to eql(3)
  end

  it 'should have a quantity' do
    expect(subject.quantity).to eql(100)
  end
end
