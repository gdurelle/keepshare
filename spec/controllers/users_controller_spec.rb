require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:admin) { FactoryGirl.create :user, :admin }
  let!(:user) { FactoryGirl.create :user }

  before do
    basic_auth admin.email
  end

  describe 'GET #show' do
    it "returns the user infos" do
      get :show, id: user.id, format: :json
      expect(response.body).to eq(user.as_json.to_json)
    end
  end

  describe 'POST #create' do
    it 'returns http success' do
      post :create, user: { email: 'test@test.com', password: 'abcd1234' }
      expect(response).to have_http_status(:created)
    end
    context 'when bad request' do
      it 'returns no_content' do
        post :create, user: { email: 'test@test.com', password: nil }
        expect(response).to have_http_status(:no_content)
      end
    end
  end

  describe 'PATCH #update' do
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

  describe 'DELETE #destroy' do
    it 'returns http success' do
      delete :destroy, id: user.id
      expect(response).to have_http_status(:no_content)
    end
    context 'record does not exists' do
      it 'returns not_found' do
        delete :destroy, id: 0
        expect(response).to have_http_status(:not_found)
      end
    end
    context 'when user is admin' do
      it 'returns unprocessable_entity' do
        expect do
          delete :destroy, id: admin.id
        end.not_to change(User, :count)
        expect(response).to have_http_status(:forbidden)
      end
    end
  end
end
