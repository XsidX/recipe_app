require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  describe 'GET foods#index' do
    before(:each) do
      @user = User.create(name: 'Sid', email: 'sid@test.com', password: '123456789')
      post user_session_path, params: { user: { email: @user.email, password: @user.password } }
      get foods_path
    end

    it 'Check status response' do
      expect(response.status).to be(200)
    end

    it 'should render correct template' do
      expect(response).to render_template(:index)
    end
  end
end
