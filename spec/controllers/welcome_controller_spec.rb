require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe "GET #home" do
    it "fails without login" do
      get :home
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
