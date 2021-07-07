class UserListController < ApplicationController
  before_action :set_user_list, only: [:show]
  def index
    @user_lists = User.all
  end

  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user_list
    @user_list = User.find(params[:id])
  end
end
