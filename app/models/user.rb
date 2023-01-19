class User < ApplicationRecord
  has_many :posts
  has_many :comments, through: :posts
  has_many :likes, through: :posts

  # A method that returns the 3 most recent posts for a given user.
  def recent_posts
    Post.where(author: self).order(created_at: :desc).limit(3)
  end
end
