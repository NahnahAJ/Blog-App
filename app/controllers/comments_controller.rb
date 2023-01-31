class CommentsController < ApplicationController
  def new
    @comments = Comment.new
  end

  def create
    new_comment = Comment.new(text: params[:comment][:text], post: Post.find(params[:post_id]), author: current_user)
    if new_comment.save
      redirect_to user_posts_path
    else
      render :new
    end
  end
end
