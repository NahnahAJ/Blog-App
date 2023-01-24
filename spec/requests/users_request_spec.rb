require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    before (:each) {get '/users'}

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns a list of users' do
      expect(response.body).to include("Hey there")
    end

    # If a correct template was rendered
    it 'renders the index template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /users/:id' do
    before (:each) {get '/users/1'}

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns a user' do
      expect(response.body).to include("Its message from show.html.erb")
    end

    # If a correct template was rendered
    it 'renders the show template' do
      expect(response).to render_template("show")
    end
  end
end