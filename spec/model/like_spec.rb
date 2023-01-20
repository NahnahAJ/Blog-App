require 'rails_helper'

RSpec.describe Like, type: :model do
  # tests go here

  describe 'associations' do
    it 'belongs to author' do
      like = Like.reflect_on_association(:author)
      expect(like.macro).to eq(:belongs_to)
    end

    it 'belongs to post' do
      like = Like.reflect_on_association(:post)
      expect(like.macro).to eq(:belongs_to)
    end
  end

  describe 'update_likes_counter' do
    let(:user) { User.create(name: 'John Doe') }
    let(:post) { Post.create(title: 'Post 1', author: user) }
    let(:like) { Like.create(author: user, post:) }

    it 'increments the likes counter on the associated post' do
      expect { like.update_likes_counter }.to change { post.reload.likes_counter }.by(2)
    end
  end
end
