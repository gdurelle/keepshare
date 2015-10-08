class ItemsController < ApplicationController
  load_and_authorize_resource :list
  load_and_authorize_resource :item, :through => :list

  def index
    head :not_found and return if @list.nil?
    items = @list.items
    render json: items.as_json
  end

  def create
    item = @list.items.create(item_params)
    render json: item.as_json
  end

  def update
    render json: :ok
  end

  def destroy
    head :no_content
  end

  private

  def item_params
    params.require(:item).permit :content
  end
end
