class PostsController < ApplicationController
  load_and_authorize_resource
  POSTS_PER_PAGE = 2

  def index
    @page = params.fetch(:page, 0).to_i
    @page = 0 if @page.negative? || @page > (Post.count / POSTS_PER_PAGE)
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(comments: [:user]).offset(@page * POSTS_PER_PAGE).limit(POSTS_PER_PAGE)
  end

  def show
    @user = current_user
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:user)
  end

  def new
    @post = Post.new
    @user = current_user
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      puts @post
      redirect_to user_posts_path(current_user)
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_posts_path(current_user)
  end

  def like
    @post = Post.find(params[:id])
    Like.new(user: current_user, post: @post).save
    redirect_to user_posts_path(current_user)
  end

  def comment
    @post = Post.find(params[:id])
    @comment = Comment.new(user: current_user, post: @post, text: params[:text])
    authorize! :add, @comment
    @comment.save
    redirect_to user_posts_path(current_user)
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end

end
