class Api::PostsController < ApplicationController
  before_action :require_login

  def index
    return unless current_user
    posts = Post.where(user_id: params[:user_id]).order(created_at: :desc)
    render json: { posts: }, status: :ok
  end
end
