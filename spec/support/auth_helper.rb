module AuthHelper
  def basic_auth(username, password = 'abcd1234')
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(username, password)
  end
end
