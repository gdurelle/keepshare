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
      expect(response.body).to eq(items.to_json)
    end
  end

  describe 'create' do
    let(:test_content) {'Test item content'}
    context 'when user owns list' do
      it 'creates the item' do
        post :create, list_id: list.id, item: { content: test_content }
        answer = JSON.parse(response.body)
        expect(answer['content']).to eq(test_content)
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
    it 'changes the item content'
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
    it 'destroys the item'
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
    end
  end
end
