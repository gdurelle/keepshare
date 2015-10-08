module AuthHelper
  def basic_auth(username, password = 'abcd1234')
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(username, password)
  end

  def basic_logout
    request.env['HTTP_AUTHORIZATION'] = nil
  end
end
