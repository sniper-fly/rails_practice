class UserListController < ApplicationController
  before_action :set_user_list, only: [:show, :create, :destroy]
  def index
    @user_lists = User.index_all.page(params[:page])
  end

  def show
  end

  def create # follow
    Relationship.create(follower_id: current_user.id, followed_id: @user_list.id)
    redirect_to user_list_index_url, notice: "#{@user_list.email}さんをフォローしました。"
  end

  def destroy # unfollow
    Relationship.find_by(follower_id: current_user.id, followed_id: @user_list).destroy();
    redirect_to user_list_index_url, notice: "#{@user_list.email}さんをフォロー解除しました。"
  end

  def followers
    @followers = current_user.followers.page(params[:page])
  end

  def follow
    @follow_users = current_user.following.page(params[:page])
  end


  private

  def set_user_list
    @user_list = User.find(params[:id])
  end
end
