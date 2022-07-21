class Api::CommentsController < ApplicationController

    before_action :require_login
    skip_before_action :verify_authenticity_token

    def index
        return unless current_user
        @comments = Comment.where(post_id: params[:id])
        render json: { comments: }, status: :ok
    end

    def create
        return unless current_user
        comment = Comment.new(comment_params)
        comment.user_id = current_user.id
        comment.post_id = params[:id]
        if @comment.save
            render json: { comment: }, status: :ok
        else
            render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:text)
    end
end
