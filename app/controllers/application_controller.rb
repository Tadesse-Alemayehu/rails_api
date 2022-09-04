class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  include ProcessToken
  before_action :autorize_user_login
  def autorize_user_login
    authorization=request.headers["Authorization"]
    token=authorization.split(" ").last if authorization
    payload=decode_token(token) if token
    puts "payload is #{payload}"
    @current_user=User.find_by(email: payload["email"]) if payload
    puts "cyrrent user is #{@current_user}"
    if !@current_user
          respond_to do |format|
            format.html
            format.json {render json: {error: "unauthorized"}, status: :unauthorized}
          end
    end
  end
end
