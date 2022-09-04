class UsersController < ApplicationController
  skip_before_action :autorize_user_login, only: [:create]
  #TODO empliment all this with authorization
  def index
    @users=User.all
    respond_to do |format|
      format.html
      format.json {render :json => @users}
    end
  end

  def show
    @user=@current_user
        respond_to do |format|
          format.html
          format.json {render :json => @user}
        end
  end

  def create
    puts params
    newuser=User.new(name: params[:name],email: params[:email],password: params[:password])
    newuser.save!
    token=generate_token({name: newuser.name, email: newuser.email, password: newuser.password})
        respond_to do |format|
          format.html
          format.json {render :json => {token: token}}
        end
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
