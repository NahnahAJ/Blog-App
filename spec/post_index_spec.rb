require_relative 'rails_helper'

RSpec.describe 'Posts Index Page', type: :system do

  describe 'index page' do
    before(:each) do
      @user = User.create(name: 'Nahnah', photo: 'https://i.imgur.com/9yG7zZT.jpg')
      @post = Post.create(title: 'Post 1', text: 'This is post 1', author: @user)
      @post2 = Post.create(title: 'Post 2', text: 'This is post 2', author: @user)
      @post3 = Post.create(title: 'Post 3', text: 'This is post 3', author: @user)
      @post4 = Post.create(title: 'Post 4', text: 'This is post 4', author: @user)
      visit user_posts_path(@user)
    end

  end

end