class Api::PostsController < ApplicationController
  before_action :require_login

def index
  if current_user_id
      puts 'You made it'
      posts = Post.where(user_id: params[:user_id]).order(created_at: :desc)
      render json: { posts: }, status: :ok
  end
end

end