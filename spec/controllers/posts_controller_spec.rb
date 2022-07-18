require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  user = User.create(name: 'henry', photo: '', bio: 'teacher from Poland')
  Post.create(title: 'post1', text: 'text1', user:)
  describe 'GET /users/:id/posts' do
    it 'response for index action status is correct' do
      get user_posts_path(User.last)
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get user_posts_path(User.last)
      expect(response).to render_template('index')
    end

    it 'the response body of index includes correct placeholder text' do
      get user_posts_path(User.last)
      expect(response.body).to include(User.last.name)
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    it 'response for show action status is correct' do
      get user_post_path(User.last, Post.last)
      expect(response).to have_http_status(200)
    end
    it 'renders the show template' do
      get user_post_path(User.last, Post.last)
      expect(response).to render_template('show')
    end
    it 'the response body of show includes correct placeholder text' do
      get user_post_path(User.last, Post.last)
      expect(response.body).to include(Post.last.title)
    end
  end
end
