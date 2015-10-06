class ListController < ApplicationController
  def index
    list = current_user.list
    render json: { id: list.id, name: list.name }
  end
end
