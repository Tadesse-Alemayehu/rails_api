class UsersController < ApplicationController
  before_action :authorize_user_with_token, only: [:show]
  def index
        respond_to do |format|
          format.html
          format.json do
            render :json => [@current_user,jwt_encode({
              name: @current_user.name,
              email: @current_user.email,
              name: '123456'
              })]
          end
        end
  end

  def show
        respond_to do |format|
          format.html
          format.json do
            render :json => @current_user
          end
        end
  end

  def new
  end

  def destroy
  end

  def edit
  end

  def update
  end
end
