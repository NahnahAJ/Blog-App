class LikesController < ApplicationController
  def new 
    post = Post.find(params[:post_id])
    author = User.find(params[:user_id])
    like = Like.new(author: author, post: post)
    if like.save 
      redirect_to user_posts_path
    end
  end    
end
