class LikesController < ApplicationController
  def new
    post = Post.find(params[:post_id])
    author = User.find(params[:user_id])
    like = Like.new(author:, post:)
    return unless like.save

    redirect_to user_posts_path
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy
    # reduce the likes counter for the post by 1
    Post.decrement_counter(:likes_counter, like.post_id)
    redirect_to user_posts_path
  end
end
