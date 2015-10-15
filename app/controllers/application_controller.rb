class ApplicationController < ActionController::Base
  include CanCan::ControllerAdditions

  protect_from_forgery with: :null_session

  rescue_from CanCan::AccessDenied do |exception|
    head :forbidden
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    head :not_found
  end

  before_action :basic_auth

  def basic_auth
    if user = authenticate_with_http_basic { |email, password| User.authenticate(email, password) }
      @current_user = user
    else
      request_http_basic_authentication
    end
  end
end
