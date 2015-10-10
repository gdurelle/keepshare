class ListsController < ApplicationController
  load_and_authorize_resource

  def index
    render json: @lists.as_json
  end

  def show
    head :not_found and return if @list.nil?
    render json: @list.as_json
  end

  def create
    current_user.lists.create(list_params)
    head :created
  end

  def update
    if @list.update_attributes name: list_params['name']
      head :ok
    else
      render json: {
        errors: @list.errors.full_messages.join(', '),
        links: { self: list_url(@list.id) }
      }, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
    head :no_content
  end

  private

  def list_params
    params.require(:list).permit :name
  end
end
