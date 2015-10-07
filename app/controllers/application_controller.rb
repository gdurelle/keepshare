class ApplicationController < ActionController::Base
  include CanCan::ControllerAdditions

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_action :basic_auth

  def basic_auth
    if user = authenticate_with_http_basic { |email, password| User.authenticate(email, password) }
      @current_user = user
    else
      request_http_basic_authentication
    end
  end
end
