class User < ApplicationRecord
  has_many :posts
  has_many :comments, through: :posts
  has_many :likes, through: :posts

  #   Name must not be blank.
  validates :name, presence: true
  # PostsCounter must be an integer greater than or equal to zero.
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # A method that returns the 3 most recent posts for a given user.
  def recent_posts
    Post.where(author_id: id).order(created_at: :desc).limit(3)
  end
end
