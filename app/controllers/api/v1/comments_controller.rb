class Api::V1::CommentsController < ApplicationController
  def index
    @comments = Comment.where(post_id: params[:post_id])
    render json: @comments
  end

  def create
    @comment = Comment.create(comment_params)

    if @comment.save
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def show
    @comment = Comment.find(params[:id])
    render json: @comment
  end

  private

  def comment_params
    params.require(:comment).permit(:author_id, :post_id, :text)
  end
end
