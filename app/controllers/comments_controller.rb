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

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    # reduce the comments counter for the post by 1
    Post.decrement_counter(:comments_counter, comment.post_id)
    redirect_to user_posts_path
  end
end
