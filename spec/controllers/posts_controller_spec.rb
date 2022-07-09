require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /users/:id/posts' do
    it 'response for index action status is correct' do
      get user_posts_path(1)
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get user_posts_path(1)
      expect(response).to render_template('index')
    end

    it 'the response body of index includes correct placeholder text' do
      get user_posts_path(1)
      expect(response.body).to include('Post List')
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    it 'response for show action status is correct' do
      get user_post_path(1, 2)
      expect(response).to have_http_status(200)
    end
    it 'renders the show template' do
      get user_post_path(1, 2)
      expect(response).to render_template('show')
    end
    it 'the response body of show includes correct placeholder text' do
      get user_post_path(1, 2)
      expect(response.body).to include('Post')
    end
  end
end
