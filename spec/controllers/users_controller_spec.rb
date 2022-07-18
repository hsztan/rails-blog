require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    User.create(name: 'henry', photo: '', bio: 'teacher from Poland')
    it 'response for index action status is correct' do
      get users_path
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get users_path
      expect(response).to render_template('index')
    end

    it 'the response body of index includes correct placeholder text' do
      get users_path
      expect(response.body).to include(User.last.name)
    end
  end

  describe 'GET /users/:id' do
    User.create(name: 'henry', photo: '', bio: 'teacher from Poland')
    it 'response for show action status is correct' do
      get user_path(User.last)
      expect(response).to have_http_status(200)
    end
    it 'renders the show template' do
      get user_path(User.last)
      expect(response).to render_template('show')
    end
    it 'the response body of show includes correct placeholder text' do
      get user_path(User.last)
      expect(response.body).to include(User.last.bio)
    end
  end
end
