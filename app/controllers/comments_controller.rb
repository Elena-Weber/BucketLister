class CommentsController < ApplicationController

    def index
        @comments = Comment.all
        @comments_count = Comment.count
    end

    def show
        @comment = Comment.find(params[:id])
    end

    def new
    end

    def create
        @comment = Comment.new(comment_params)
        if @comment.save
            redirect_to comment_path(@comment)
        else
            redirect_to @comment
        end
    end

    def edit
        @comment = Comment.find(params[:id])
    end

    def update
        @comment = Comment.find(params[:id])
        @comment.update(comment_params)
        redirect_to comment_path(@comment)
    end

    def destroy
        @comment = Comment.find(params[:id]).destroy
        redirect_to goals_path
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :user_id, :goal_id)
    end

end
