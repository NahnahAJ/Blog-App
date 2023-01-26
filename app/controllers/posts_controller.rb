class PostsController < ApplicationController
  def index
    @posts = Post.all
    @user = User.where(id: params[:user_id]).first
    @comments = Comment.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.all
  end
end
