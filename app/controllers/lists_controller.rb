class ListsController < ApplicationController
  load_and_authorize_resource

  def index
    render json: @lists.as_json
  end

  def show
    head :not_found and return if @list.nil?
    items = @list.items
    render json: { data: { list: @list.as_json, items: items.as_json } }
  end
end
