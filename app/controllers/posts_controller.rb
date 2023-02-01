class PostsController < ApplicationController
  def index
    @posts = Post.includes(:comments).where(author_id: params[:user_id])
    @user = User.where(id: params[:user_id]).first
    @comments = Comment.includes(:author).order(created_at: :desc)
    @like = Like.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.includes(:author).where(id: params[:user_id]).order(created_at: :desc)
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
