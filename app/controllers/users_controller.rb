class UsersController < ApplicationController
  before_action :authorize_user_with_token, only: [:show]
  skip_before_action :verify_authenticity_token
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
    # this is only for html render
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
    user=User.find(@current_user.id)
    if user
      Like.where(user: user).destroy_all
      Comment.where(user: user).destroy_all
      posts=Post.where(user: user)
      posts.each do |post|
      Like.where(post: post).destroy_all
      Comment.where(post: post).destroy_all
      end
      posts.destroy_all
      user.destroy
          respond_to do |format|
            format.html {render :index}
            format.json {render :json =>[], :status => :ok }
          end
        else
          respond_to do |format|
            format.html {render :index}
            format.json {render :json =>[], :status =>:internal_server_error }
          end
    end
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
