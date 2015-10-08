require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(:user) { FactoryGirl.create :user }
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
end
