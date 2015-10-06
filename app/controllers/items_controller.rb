class ItemsController < ApplicationController
  def index
    items = current_user.list.items
    render json: items.as_json
  end

  def create
  end

  def update
  end

  def destroy
  end
end
