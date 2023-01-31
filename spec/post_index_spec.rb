
require_relative 'rails_helper'
require 'selenium-webdriver'

RSpec.describe 'Posts Index Page', type: :system do
  describe 'index page(I can see the user\'s profile picture)' do
    before(:each) do
      @user = User.create(name: 'Nahnah', photo: 'https://i.imgur.com/9yG7zZT.jpg')
      @post = Post.create(title: 'Post 1', text: 'This is post 1', author: @user)
      @post2 = Post.create(title: 'Post 2', text: 'This is post 2', author: @user)
      @post3 = Post.create(title: 'Post 3', text: 'This is post 3', author: @user)
      @post4 = Post.create(title: 'Post 4', text: 'This is post 4', author: @user)
      visit user_posts_path(@user)
      @comment = Comment.create(text: 'This is a comment', author: @user, post: @post)
      @comment2 = Comment.create(text: 'This is a comment', author: @user, post: @post)
      @like = Like.create(author: @user, post: @post)
      @like2 = Like.create(author: @user, post: @post)
    end

      it 'should show the profile picture for each user' do
      expect(page).to have_css("img[src*='https://i.imgur.com/9yG7zZT.jpg']")
      end

      it 'should show the name of the user' do
      expect(page).to have_content('Nahnah')
      end

      it 'should show the number of the posts' do
      expect(page).to have_content('4')
      end

      it 'should show the title of the post' do
      expect(page).to have_content('Post 1')
      end

      it 'should show the some of the post content' do
      expect(page).to have_content('This is post 1')
      end

      it 'should show the number of comments for a particular post' do
      expect(page).to have_content('2')
      end


  end
end
