class ItemsController < ApplicationController
  load_and_authorize_resource :list
  load_and_authorize_resource :item, :through => :list, param_method: :item_params

  def index
    head :not_found and return if @list.nil?
    items = @list.items
    render json: items.as_json
  end

  def show
    head :not_found and return if @item.nil?
    render json: @item.as_json
  end

  def create
    begin
      item = @list.items.create!(item_params)
      render json: item.as_json, status: :created
    rescue StandardError => e
      render json: e.message, status: :no_content
    end
  end

  def update
    if @item.update_attributes content: item_params['content']
      head :ok
    else
      render_json_error
    end
  end

  def destroy
    @item.destroy
    head :no_content
  end

  private

  def item_params
    params.require(:item).permit :content
  end

  def render_json_error
    render json: {
      errors: @item.errors.full_messages.join(', '),
      links: { self: list_item_url(@item.list_id, @item.id) }
    }, status: :unprocessable_entity
  end
end
