class PostsController < ApplicationController
  def index
    @posts = Post.all
    @user = User.where(id: params[:user_id]).first
    @comments = Comment.all
    @like = Like.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.all
  end

  def new
    @post = Post.new
  end

  def create
    new_post = Post.new(title: params[:post][:title], text: params[:post][:text], author: current_user)
    if new_post.save
      redirect_to user_posts_path
    else
      render :new
    end
  end
end
