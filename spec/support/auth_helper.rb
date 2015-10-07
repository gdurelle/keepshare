module AuthHelper
  def http_auth_as(username, password = 'abcd1234', &block)
    @env = {} unless @env
    old_auth = @env['HTTP_AUTHORIZATION']
    @env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(username, password)
    yield block
    @env['HTTP_AUTHORIZATION'] = old_auth
  end
end
