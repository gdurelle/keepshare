require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:admin) { FactoryGirl.create :user, :admin }
  let!(:user) { FactoryGirl.create :user }

  before do
    basic_auth admin.email
  end

  describe 'show' do
    it "returns the user infos" do
      get :show, id: user.id, format: :json
      expect(response.body).to eq(user.as_json.to_json)
    end
  end

  describe 'GET #create' do
    it 'returns http success' do
      get :create, user: { email: 'test@test.com', password: 'abcd1234' }
      expect(response).to have_http_status(:created)
    end
  end

  describe 'GET #update' do
    it 'returns http success' do
      patch :update, id: user.id, user: { password: 'abcd1234' }, format: :json
      expect(response).to have_http_status(:success)
    end
    it 'changes the user password' do
      expect do
        patch :update, id: user.id, user: { password: 'abcd1234' }, format: :json
        user.reload
      end.to change(user, :crypted_password)
      expect(response).to have_http_status(:success)
    end
    context 'when bad request' do
      it 'returns unprocessable_entity' do
      expect do
        patch :update, id: user.id, user: { password: nil }, format: :json
        user.reload
      end.not_to change(user, :crypted_password)
      expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'GET #destroy' do
    it 'returns http success' do
      get :destroy, id: user.id
      expect(response).to have_http_status(:no_content)
    end
  end
end
