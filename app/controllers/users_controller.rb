class UsersController < ApplicationController

  def index
    @users =  User.all
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles
    user_path(@user)
  end

  def following
    @title = "Following"
    @users =  current_user.followings
    render 'users/show_follow'
  end

  def followers
    @title = "Followers"
    @users =  current_user.followers
    render 'users/show_follow'
  end

  def follow
    follow = Follow.new(follower_id: current_user.id, followed_user_id: params[:id])
    follow.save
    redirect_back(fallback_location: root_path)
  end

  def unfollow
    follow = Follow.where(follower_id: current_user.id, followed_user_id: params[:id])
    follow[0].destroy
    redirect_back(fallback_location: root_path)
  end

end
