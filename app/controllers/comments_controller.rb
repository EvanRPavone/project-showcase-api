class CommentsController < ApplicationController
    def create
        Comment.create(
            text: comment_params[:text], 
            user_id: comment_params[:userId], 
            project_id: comment_params[:project_id]
            )
        render json: { message: 'comment saved'}
    end

    def index
        comments = Comment.where(project_id: params[:project_id])
        render json: comments, include: { user: { only: [:username] } }
    end

    private

    def comment_params
        params.permit(:text, :userId, :project_id)
    end
end
