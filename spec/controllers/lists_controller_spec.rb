require 'rails_helper'

RSpec.describe ListsController, type: :controller do
  let(:user) { FactoryGirl.create :user }
  let!(:lists) { FactoryGirl.create_list :list, 2, user: user }

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
    it "returns user's lists with its items" do
      get :show, id: lists.first.id, format: :json
      answer = JSON.parse(response.body)
      expect(answer.keys.first).to eq('data')
      expect(answer['data'].keys.first).to eq('list')
      expect(answer['data'].keys.last).to eq('items')
      expect(answer['data'].values.last).to eq([])
    end
  end
end
