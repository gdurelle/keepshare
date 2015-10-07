class ItemsController < ApplicationController
  def index
    list = List.where(id: params[:list_id]).first
    head :not_found and return if list.nil?
    items = list.items
    render json: items.as_json
  end

  def create
  end

  def update
  end

  def destroy
  end
end
