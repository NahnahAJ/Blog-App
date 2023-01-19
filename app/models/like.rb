class Like < ApplicationRecord
  after_create :update_likes_counter
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def update_likes_counter
    post_id = post.id
    Post.increment_counter(:likes_counter, post_id)
  end
end
