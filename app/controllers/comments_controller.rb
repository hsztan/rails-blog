class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(user: current_user, post: @post, text: params[:text])
    @comment.save
    authorize! :create, @comment
    redirect_to user_posts_path(@post.user)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to user_posts_path(current_user)
  end
end
