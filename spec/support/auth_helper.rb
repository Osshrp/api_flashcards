module AuthHelper
  def auth
    user = 'test@test.ru'
    pw = '123'
    request.env['HTTP_AUTHORIZATION'] =
      ActionController::HttpAuthentication::Basic.encode_credentials(user,pw)
  end
end