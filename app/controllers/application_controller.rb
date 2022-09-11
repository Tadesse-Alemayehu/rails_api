class ApplicationController < ActionController::Base
  include TokenAuthorization
before_action :set_current_user
  def authorize_user

  end
  def set_current_user
    @current_user=User.first
  end
end
