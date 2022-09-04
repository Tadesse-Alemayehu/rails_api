module ProcessToken
  def generate_token payload
    JWT.encode payload,'mysecret','HS256'
  end

  def decode_token token
    JWT.decode(token,'mysecret','HS256')[0]
  end
end
