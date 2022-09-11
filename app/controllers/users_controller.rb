class UsersController < ApplicationController
  before_action :authorize_user_with_token, only: [:show]
  skip_before_action :verify_authenticity_token, only: [:create]
  def index
        respond_to do |format|
          format.html
          format.json do
            render :json => [@current_user,jwt_encode(@current_user.as_json)]
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

  def create
    user=User.create!(user_params)
    if user
          respond_to do |format|
            format.html
            format.json {render :json => user, :status => :ok}
          end
    else
          respond_to do |format|
            format.html
            format.json {render :status => :bad_request}
          end
    end
  end
  def destroy
  end

  def edit
  end

  def update
  end
  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
