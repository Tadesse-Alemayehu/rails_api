class UsersController < ApplicationController
  before_action :authorize_user, only: [:show]
  def index
        respond_to do |format|
          format.html
          format.json do
            render :json => User.all
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
