require_relative 'rails_helper'

RSpec.describe 'Posts show Page', type: :system do
    describe 'post page' do
      before(:each) do
        @user = User.create(name: 'Nahnah', photo: 'https://i.imgur.com/9yG7zZT.jpg')
        @post = Post.create(title: 'Post 1', text: 'This is post 1', author: @user)
        @comment = Comment.create(text: 'This is the first comment', author: @user, post: @post)
        @comment2 = Comment.create(text: 'This is a comment', author: @user, post: @post)
        @like = Like.create(author: @user, post: @post)
        @like2 = Like.create(author: @user, post: @post)
        visit user_posts_path(@user, @post)
      end

      it 'I can see the post\'s title.' do
        expect(page).to have_content('Post 1')
      end
      
        it 'I can see the post\'s author.' do
        expect(page).to have_content('Nahnah')
      end

        it 'I can see how many comments it has.' do
        expect(page).to have_content('2')
      end

        it 'I can see how many likes it has.' do
        expect(page).to have_content('2')
      end

        it 'I can see the post\'s body.' do
        expect(page).to have_content('This is post 1')
        end

        it 'I can the username of each commentor.' do
        expect(page).to have_content('Nahnah')
        end

        it 'I can see the comment each commentor left.' do
        expect(page).to have_content('This is the first comment')
        end


    end
end