require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    @user = User.create(name: '', email: 'sid@test.com', password: '123456789')
  end
  before { subject.save }

  it 'name should not be nil' do
    expect(subject).to_not be_valid
  end

end