class CommentsController < ApplicationController

    before_action :find_comment, only: [:show, :edit, :update, :destroy]
    before_action :authorized_comments, only: [:edit, :update, :destroy]

    def index
        @comments = Comment.all
        @user = User.find_by_id(params[:user_id])
    end

    def show
    end

    def new
        @goal = Goal.find(params[:goal_id])
        @comment = @goal.comments.build
    end

    def create
        @comment = Comment.new(comment_params)
        @goal = Goal.find(params[:goal_id])
        @comment.goal_id = @goal.id
        @comment.user_id = current_user.id
        if @comment.save
            redirect_to comment_path(@comment)
        else
            render 'comments/new'
        end
    end

    def edit
    end

    def update
        @comment.update(comment_params)
        redirect_to comment_path(@comment)
    end

    def destroy
        @comment.destroy
        redirect_to goals_path
    end

    private

    def find_comment
        @comment = Comment.find(params[:id])
    end

    def comment_params
        params.require(:comment).permit(:content, :user_id, :goal_id)
    end

    def authorized_comments
        redirect_to goals_path unless logged_in? && @comment.user.id == current_user.id
    end

end
