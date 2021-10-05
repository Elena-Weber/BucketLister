class CommentsController < ApplicationController

    # what to do before displaying comments
    before_action :find_comment, only: [:show, :edit, :update, :destroy]
    before_action :authorized_comments, only: [:edit, :update, :destroy]

    def index # all comments
        @comments = Comment.all
        @user = User.find_by_id(params[:user_id])
    end

    def show
    end

    def new # create new comment form
        @goal = Goal.find(params[:goal_id])
        @comment = @goal.comments.build
    end

    def create # save new comment
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

    def update # edit comment
        @comment.update(comment_params)
        redirect_to comment_path(@comment)
    end

    def destroy # delete comment
        @comment.destroy
        redirect_to goals_path
    end

    private

    def find_comment # display a found comment
        @comment = Comment.find(params[:id])
    end

    def comment_params #allowed comments parameters
        params.require(:comment).permit(:content, :user_id, :goal_id)
    end

    def authorized_comments # users can edit only their own comments
        redirect_to goals_path unless logged_in? && @comment.user.id == current_user.id
    end

end
