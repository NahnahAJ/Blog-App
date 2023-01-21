class Post < ApplicationRecord
  after_create :posts_counter_update
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  #   Title must not be blank.
  # Title must not exceed 250 characters.
  validates :title, presence: true, length: { maximum: 250 }

  # CommentsCounter must be an integer greater than or equal to zero.
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # LikesCounter must be an integer greater than or equal to zero.
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # A method that updates the posts counter for a user.
  def posts_counter_update
    author_id = author.id
    User.increment_counter(:posts_counter, author_id)
  end

  def recent_comments
    Comment.where(post_id: id).order(created_at: :desc).limit(5)
  end
end
