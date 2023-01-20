require 'rails_helper'

RSpec.describe Comment, type: :model do
  #tests go here

  describe 'associations' do
    it 'belongs to author' do
      comment = Comment.reflect_on_association(:author)
      expect(comment.macro).to eq(:belongs_to)
    end

    it 'belongs to post' do
      comment = Comment.reflect_on_association(:post)
      expect(comment.macro).to eq(:belongs_to)
    end
  end

  describe 'update_comment_counter' do
    let(:user) { User.create(name: 'John Doe') }
    let(:post) { Post.create(title: 'Post 1', author: user) }
    let(:comment) { Comment.create(author: user, post: post) }

    it 'increments the comments counter on the associated post' do
      expect{ comment.update_comment_counter }.to change{ post.reload.comments_counter }.by(2)
    end
  end
end