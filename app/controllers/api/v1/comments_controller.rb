class Api::V1::CommentsController < ApplicationController
  protect_from_forgery with: :exception
  def index
    @comments = Comment.where(post_id: params[:post_id])
    render json: @comments
  end

  def create
    @comment = Comments.create(text: params[:comment][:text], author: current_user, post_id: params[:post_id])
    if @comment.save
      render json: @comment
    else
      render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
