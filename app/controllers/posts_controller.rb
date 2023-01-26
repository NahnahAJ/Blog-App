class PostsController < ApplicationController
  def index
    @posts = Post.all
    @users = User.all
    @comments = Comment.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.all
  end
end
