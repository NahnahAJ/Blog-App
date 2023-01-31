require_relative 'rails_helper'

RSpec.describe 'Users Show Page', type: :system do
  describe 'show page' do
    before(:each) do
      @user = User.create(name: 'Nahnah', photo: 'https://i.imgur.com/9yG7zZT.jpg', bio: 'I am an awesome person')
      @post = Post.create(title: 'Post 1', text: 'This is post 1', author: @user)
      @post2 = Post.create(title: 'Post 2', text: 'This is post 2', author: @user)
      @post3 = Post.create(title: 'Post 3', text: 'This is post 3', author: @user)
      @post4 = Post.create(title: 'Post 4', text: 'This is post 4', author: @user)
      visit user_path(@user)
    end

    # I can see the user's profile picture.
    it 'shows the users profile picture' do
      expect(page).to have_css("img[src*='https://i.imgur.com/9yG7zZT.jpg']")
    end

    # I can see the user's username.
    it 'shows the users username' do
      expect(page).to have_content('Nahnah')
    end

    # I can see the number of posts the user has written.
    it 'shows the number of posts the user has written' do
      expect(page).to have_content('Number of posts: 4')
    end

    # I can see the user's bio.
    it 'shows the users bio' do
      expect(page).to have_content('I am an awesome person')
    end

    # I can see the user's first 3 posts.
    it 'shows the users 3 recent posts' do
      expect(page).to have_content('Post 4')
      expect(page).to have_content('Post 3')
      expect(page).to have_content('Post 2')
    end

    # I can see a button that lets me view all of a user's posts.
    it 'shows a button that lets me view all of a users posts' do
      expect(page).to have_link('See all posts')
    end

    # When I click to see all posts, it redirects me to the user's post's index page.
    it 'redirects me to the users posts index page when I click the button' do
      click_link('See all posts')
      expect(page).to have_content('Nahnah')
      expect(page).to have_content('Number of posts: 4')
      expect(page).to have_content('Post 4')
    end

    # When I click a user's post, it redirects me to that post's show page.
    it 'redirects me to the post show page when I click a post' do
      click_link('See all posts')
      find(:link, 'See Post', match: :first).click
      expect(page).to have_content('Post 1')
    end
  end
end
