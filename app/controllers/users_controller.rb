class UsersController < ApplicationController
  include JsonErrorController

  load_and_authorize_resource param_method: :user_params

  def show
    head :not_found and return if @user.nil?
    render json: @user.as_json
  end

  def create
    begin
      user = User.create!(user_params)
      render json: user.as_json, status: :created
    rescue StandardError => e
      render json: e.message, status: :no_content
    end
  end

  def update
    if @user.update_attributes user_params
      head :ok
    else
      render_json_error
    end
  end

  def destroy
    @user.destroy
    head :no_content
  end

  private

  def user_params
    params.require(:user).permit :email, :password
  end
end
