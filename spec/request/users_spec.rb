require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) { User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.') }
  describe 'GET /' do
    it 'renders the root page' do
      get '/'
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /users' do
    it 'renders the users index page' do
      get '/users'
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /users' do
    it 'renders the user index page with correct template' do
      get '/users'
      expect(response).to render_template(:index)
    end
  end
  describe 'GET /users' do
    it 'renders the user index page with correct placeholder text' do
      get '/users'
      expect(response.body).to include('User 1')
    end
  end

  describe 'GET /users/:id' do
    it 'renders the user show page' do
      get "/users/:#{user.id}"
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /users/:id' do
    it 'renders the user show page with correct template' do
      get "/users/#{user.id}"
      expect(response).to render_template(:show)
    end
  end

  describe 'GET /users/:id' do
    it 'renders the user show page with correct placeholder text' do
      get "/users/#{user.id}"
      expect(response.body).to include('<h1>Render all users</h1>')
    end
  end
end
