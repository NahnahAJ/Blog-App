require 'rails_helper'

RSpec.describe User, type: :model do
  #tests go here
  describe 'validations' do
    it 'is invalid without a name' do
      user = User.new(name: nil)
      user.valid?
      expect(user.errors).to have_key(:name)
    end

    it 'is invalid with a posts_counter less than 0' do
      user = User.new(posts_counter: -1)
      user.valid?
      expect(user.errors).to have_key(:posts_counter)
    end
  end

  describe 'associations' do
    it 'has many posts' do
      user = User.reflect_on_association(:posts)
      expect(user.macro).to eq(:has_many)
    end

    it 'has many comments' do
      user = User.reflect_on_association(:comments)
      expect(user.macro).to eq(:has_many)
    end

    it 'has many likes' do
      user = User.reflect_on_association(:likes)
      expect(user.macro).to eq(:has_many)
    end
  end

  describe '#recent_posts' do
  let(:user) { User.create(name: 'John Doe') }
  let!(:post1) { Post.create(title: 'Post 1', author: user, created_at: 4.days.ago) }
  let!(:post2) { Post.create(title: 'Post 2', author: user, created_at: 3.days.ago) }
  let!(:post3) { Post.create(title: 'Post 3', author: user, created_at: 2.days.ago) }
  let!(:post4) { Post.create(title: 'Post 4', author: user, created_at: 1.day.ago) }

  it 'returns the 3 most recent posts for a given user' do
    expect(user.recent_posts).to eq([post4, post3, post2])
  end
end

end