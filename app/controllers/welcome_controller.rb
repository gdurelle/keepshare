class WelcomeController < ApplicationController
  def home
    render json: { id: current_user.id, email: current_user.email, role: current_user.role }
  end
end
