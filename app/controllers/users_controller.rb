class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def edit
  end

  def update
    redirect_to current_user if current_user.update_attributes user_params
  end

  def following
    @title = "你的关注"
    @user = User.find(params[:id])
    @users = @user.followed_users.page params[:page]
    render 'show_followers'
  end

  def followers
    @title = "粉丝"
    @user = User.find(params[:id])
    @users = @user.followers.page params[:page]
    render 'show_followers'
  end

  private
  def user_params
    params.require(:user).permit(:name, :phone,
      photos_attributes:[:id, :_destroy])
  end
end
