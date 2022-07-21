class Api::CommentsController < ApplicationController

    before_action :require_login

    def index
        return unless current_user
        @comments = Comment.where(post_id: params[:id])
        render json: { comments: }, status: :ok
    end
end
