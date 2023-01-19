class Post < ApplicationRecord
  after_create :posts_counter_update
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  # A method that updates the posts counter for a user.
  def posts_counter_update
    author_id = author.id
    User.increment_counter(:posts_counter, author_id)
  end

  def recent_comments
    Post.where(comments: self).order(created_at: :desc).limit(5)
  end
end
