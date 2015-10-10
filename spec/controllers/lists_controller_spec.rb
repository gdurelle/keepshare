require 'rails_helper'

RSpec.describe ListsController, type: :controller do
  let(:user) { FactoryGirl.create :user }
  let(:guest) { FactoryGirl.create :user, :guest }
  let(:lists) { FactoryGirl.create_list :list, 2, user: user }
  let!(:list) { lists.first }

  before do
    basic_auth user.email
  end

  describe 'index' do
    it "returns user's lists" do
      get :index, format: :json
      expect(response.body).to eq(lists.as_json.to_json)
    end
  end

  describe 'show' do
    it "returns user's list" do
      get :show, id: list.id, format: :json
      answer = JSON.parse(response.body)
      expect(answer.keys.first).to eq('data')
      expect(answer['data'].keys.first).to eq('id')
      expect(answer['data']['id']).to eq(list.id)
      expect(answer['data']['name']).to eq(list.name)
    end
  end

  describe 'create' do
    let(:test_name) {'Test list name'}

    it 'creates the list' do
      post :create, list: { name: test_name }
      expect(response).to have_http_status(:created)
    end

    context 'when guest' do
      before do
        basic_auth guest.email
      end
      it 'refuses to create the list' do
        post :create, list: { name: test_name }
        expect(response).to have_http_status(:forbidden)
      end
    end
  end

  describe 'update' do
    it 'changes the list name' do
      expect do
        patch :update, id: list.id, list: { name: 'lorem ipsum' }, format: :json
        list.reload
      end.to change(list, :name).to('lorem ipsum')
      expect(response).to have_http_status(:success)
    end
    context 'when bad request' do
      it 'returns unprocessable_entity' do
      expect do
        patch :update, id: list.id, list: { name: nil }, format: :json
        list.reload
      end.not_to change(list, :name)
      expect(response).to have_http_status(:unprocessable_entity)
      end
    end
    context 'when guest user' do
      before do
        basic_auth guest.email
      end
      it 'refuses to change the list' do
        patch :update, id: list.id, list: { name: 'lorem ipsum' }
        expect(response).to have_http_status(:forbidden)
      end
    end
  end

  describe 'destroy' do
    it 'destroys the list' do
      expect do
        delete :destroy, id: list.id
      end.to change(List, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
    context 'when guest user' do
      before do
        basic_auth guest.email
      end
      it 'refuses to destroy the list' do
        delete :destroy, id: list.id
        expect(response).to have_http_status(:forbidden)
      end
    end
    context 'when admin' do
      let(:admin) { FactoryGirl.create :user, :admin }
      before do
        basic_auth admin.email
      end
      it 'destroys the list' do
        expect do
          delete :destroy, id: list.id
        end.to change(List, :count).by(-1)
        expect(response).to have_http_status(:no_content)
      end
    end
  end
end
