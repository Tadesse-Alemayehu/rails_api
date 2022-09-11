module TokenAuthorization
  def get_token
    authorization=request.headers["Authorization"]
    if authorization
      puts "authorization"
      return authorization.split(" ").last
    else
      puts "authorization is falling"
      return false
    end
  end
  def jwt_encode data
    JWT.encode data, ENV['JWT_SECRET_KEY'], ENV['JWT_ALGORITHM']
  end
  def jwt_decode token
    JWT.decode(token, ENV['JWT_SECRET_KEY'], ENV['JWT_ALGORITHM'])[0]
  end
end
