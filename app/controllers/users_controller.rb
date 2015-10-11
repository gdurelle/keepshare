class UsersController < ApplicationController
  load_and_authorize_resource

  def show
    head :not_found and return if @user.nil?
    render json: @user.as_json
  end

  def create
    user = User.create(user_params)
    render json: user.as_json, status: :created
  end

  def update
    if @user.update_attributes user_params
      head :ok
    else
      render json: {
        errors: @user.errors.full_messages.join(', '),
        links: { self: user_url(@user.id) }
      }, status: :unprocessable_entity
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
