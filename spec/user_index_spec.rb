require 'rails_helper'

# I can see the username of all other users.
# I can see the profile picture for each user.
# I can see the number of posts each user has written.
# When I click on a user, I am redirected to that user's show page.

RSpec.describe 'Users Index Page', type: :system do
  describe 'index page' do
    before(:each) do
      @user = User.create(name: 'Nahnah', photo: 'https://i.imgur.com/9yG7zZT.jpg')
      @user2 = User.create(name: 'Nahnah2', photo: 'https://i.imgur.com/9yG7zZT.jpg')
      visit users_path
    end

    it 'shows the right content' do
      expect(page).to have_content("Nahnah's Blog App")
    end

    it 'shows username of all other users' do
      expect(page).to have_content('Nahnah')
      expect(page).to have_content('Nahnah2')
    end

    it 'should show the profile picture for each user' do
      expect(page).to have_css("img[src*='https://i.imgur.com/9yG7zZT.jpg']")
      expect(page).to have_css("img[src*='https://i.imgur.com/9yG7zZT.jpg']")
    end

    it 'should show the number of posts each user has written' do
      expect(page).to have_content('Number of posts: 0')
      expect(page).to have_content('Number of posts: 0')
    end

    it 'should redirect to user show page when clicked' do
      click_link('Nahnah')
      expect(page).to have_content('Nahnah')
    end
  end
end