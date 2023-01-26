class UsersController < ApplicationController
  def show
    # Find the user id ad author id
    @user = User.find(params[:id])
    @posts = Post.where(author_id: params[:id])
  end

  def index
    @users = User.all
  end
end
