class PostsController < ApplicationController
before_action :load_and_authorize_resource, only: [:destroy]
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

  def destroy
    @post = Post.find(params[:id])
    if @post.comments_counter.positive? || @post.likes_counter.positive?
      @post.comments.destroy_all
      @post.likes.destroy_all
    end
    @post.destroy
    User.decrement_counter(:posts_counter, @post.author_id)
    redirect_to user_posts_path
  end


  private
  #Define the load_and_authorize_resource method
  def load_and_authorize_resource
    @post = Post.find(params[:id])
    authorize! @post, :destroy? if @post.author_id != current_user.id
  end
end
