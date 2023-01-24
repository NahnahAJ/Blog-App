require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /posts' do
    before(:each) { get '/users/1/posts' }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns a list of posts' do
      expect(response.body).to include('Hello world from POSTS index.html.erb')
    end

    # If a correct template was rendered
    it 'renders the index template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /posts/:id' do
    before(:each) { get '/users/1/posts/1' }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns a post' do
      expect(response.body).to include('Hello world from POSTS show.html.erb')
    end

    # If a correct template was rendered
    it 'renders the show template' do
      expect(response).to render_template('show')
    end
  end
end
