class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable
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

  # A method that adds the role for a given user
  def add_role
    return unless Post.where(author_id: id)

    update(role: 'admin')
  end
end
