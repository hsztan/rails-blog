require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
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
      expect(response.body).to include('List of users')
    end
  end

  describe 'GET /users/:id' do
    it 'response for show action status is correct' do
      get user_path(1)
      expect(response).to have_http_status(200)
    end
    it 'renders the show template' do
      get user_path(1)
      expect(response).to render_template('show')
    end
    it 'the response body of show includes correct placeholder text' do
      get user_path(1)
      expect(response.body).to include('XXXX')
    end
  end
end
