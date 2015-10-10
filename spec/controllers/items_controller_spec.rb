require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(:user) { FactoryGirl.create :user }
  let(:guest) { FactoryGirl.create :user, :guest }
  let(:list) { FactoryGirl.create :list, user: user }
  let!(:items) { FactoryGirl.create_list :item, 2, list: list }

  before do
    basic_auth user.email
  end

  describe 'index' do
    it "returns user's items" do
      get :index, list_id: list.id, format: :json
      expect(response.body).to eq(items.as_json.to_json)
    end
  end

  describe 'show' do
    it "returns the item" do
      get :show, list_id: list, id: items.first.id, format: :json
      answer = JSON.parse(response.body)
      expect(answer['data']['id']).to eq(items.first.id)
      expect(answer['data']['content']).to eq(items.first.content)
    end
  end

  describe 'create' do
    let(:test_content) {'Test item content'}
    context 'when user owns list' do
      it 'creates the item' do
        post :create, list_id: list.id, item: { content: test_content }
        answer = JSON.parse(response.body)
        expect(answer['data']['content']).to eq(test_content)
      end
    end

    context 'when bad user' do
      let(:other_user) { FactoryGirl.create :user }
      let(:other_list) { FactoryGirl.create :list, user: other_user }
      it 'refuses to create the item' do
        post :create, list_id: other_list.id, item: { content: 'lorem ipsum' }
        expect(response).to have_http_status(:forbidden)
      end
    end

    context 'when guest' do
      before do
        basic_auth guest.email
      end
      it 'refuses to create the item' do
        post :create, list_id: list.id, item: { content: 'lorem ipsum' }
        expect(response).to have_http_status(:forbidden)
      end
    end
  end

  describe 'update' do
    it 'changes the item content' do
      expect do
        patch :update, list_id: list.id, id: items.first.id, item: { content: 'lorem ipsum' }, format: :json
        items.first.reload
      end.to change(items.first, :content).to('lorem ipsum')
      expect(response).to have_http_status(:success)
    end
    context 'when bad request' do
      it 'returns unprocessable_entity' do
      expect do
        patch :update, list_id: list.id, id: items.first.id, item: { content: nil }, format: :json
        items.first.reload
      end.not_to change(items.first, :content)
      expect(response).to have_http_status(:unprocessable_entity)
      end
    end
    context 'when guest user' do
      before do
        basic_auth guest.email
      end
      it 'refuses to change the item' do
        patch :update, list_id: list.id, id: items.first.id, item: { content: 'lorem ipsum' }
        expect(response).to have_http_status(:forbidden)
      end
    end
  end

  describe 'destroy' do
    it 'destroys the item' do
      expect do
        delete :destroy, list_id: list.id, id: items.first.id
      end.to change(Item, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
    context 'when guest user' do
      before do
        basic_auth guest.email
      end
      it 'refuses to destroy the item' do
        delete :destroy, list_id: list.id, id: items.first.id
        expect(response).to have_http_status(:forbidden)
      end
    end
    context 'when admin' do
      let(:admin) { FactoryGirl.create :user, :admin }
      before do
        basic_auth admin.email
      end
      it 'destroys the item' do
        expect do
          delete :destroy, list_id: list.id, id: items.first.id
        end.to change(Item, :count).by(-1)
        expect(response).to have_http_status(:no_content)
      end
    end
  end
end
