class UsersController < ApplicationController
  def index
        respond_to do |format|
          format.html
          format.json do
            render :json => @current_user
          end
        end
  end

  def show
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
