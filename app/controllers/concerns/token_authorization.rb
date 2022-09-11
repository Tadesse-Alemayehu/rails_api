module TokenAuthorization
  @enc='HS256'
  def jwt_encode data
    JWT.encode
  end
end
