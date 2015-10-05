class WelcomeController < ApplicationController
  def home
    render json: { id: current_user.id, role: current_user.role }
  end
end
