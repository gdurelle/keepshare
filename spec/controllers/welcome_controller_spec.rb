require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe "GET #home" do
    context 'when no auth' do
      it "fails unauthorized" do
        get :home
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when basic auth' do
      let(:user) { FactoryGirl.create :user }
      it 'succeed' do
        basic_auth user.email
        get :home
        expect(response).to have_http_status(:success)
      end
    end
  end
end
