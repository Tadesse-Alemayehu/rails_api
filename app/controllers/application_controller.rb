class ApplicationController < ActionController::Base
  include TokenAuthorization
before_action :set_current_user
  def authorize_user_with_token
    data={user: 'Tadesse Alemayehu', email: 'tadesse@gmail.com'}
    token=get_token
   user=jwt_decode(token) if token
   puts user["email"]
  end

  def set_current_user
    @current_user=User.first
  end
end
