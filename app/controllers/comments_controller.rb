class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    @post = Post.find(params[:id])
    @comment = Comment.new(user: current_user, post: @post, text: params[:text])
    authorize! :add, @comment
    @comment.save
    redirect_to user_posts_path(current_user)
  end
end