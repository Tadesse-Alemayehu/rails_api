class UsersController < ApplicationController
  #TODO empliment all this with authorization
  def index
    @users=User.all
    respond_to do |format|
      format.html
      format.json {render :json => @users}
    end
  end

  def show
    @user=User.find(params[:id])
        respond_to do |format|
          format.html
          format.json {render :json => @user}
        end
  end

  def create
    puts params
    newuser=User.new(name: params[:name],email: params[:email]);
    newuser.save!
  end

  def destroy
    puts params
    user=User.find(params[:id]);
    user.destroy
        respond_to do |format|
          format.json { head :no_content}
        end

  end
end
