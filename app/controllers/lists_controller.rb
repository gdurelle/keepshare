class ListsController < ApplicationController
  include JsonErrorController

  load_and_authorize_resource param_method: :list_params

  def index
    render json: @lists.as_json
  end

  def show
    head :not_found and return if @list.nil?
    render json: @list.as_json
  end

  def create
    begin
      list = current_user.lists.create!(list_params)
      render json: list.as_json, status: :created
    rescue StandardError => e
      render json: e.message, status: :no_content
    end
  end

  def update
    if @list.update_attributes name: list_params['name']
      head :ok
    else
      render_json_error
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
