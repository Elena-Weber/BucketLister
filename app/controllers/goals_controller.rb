class GoalsController < ApplicationController

    before_action :find_goal, only: [:show, :edit, :update, :destroy]
    before_action :authorized_goals, only: [:edit, :update, :destroy]

    def index
        @goals = Goal.all
    end

    def show
        #@goal = Goal.find(params[:id])
    end

    def new
        @goal = Goal.new
    end

    def create
        #@user = User.find_by_id(params[:user_id])
        #binding.pry
        @goal = current_user.goals.build(goal_params)
        # @goal = Goal.create(goal_params)
        # @goal.user_id = current_user.id
        if @goal.save
            redirect_to user_path(current_user)
            #redirect_to user_goals_path(current_user, @goal)
        else
            render 'goals/new'
        end
    end

    def edit
        #redirect_to goals_path unless logged_in? && @goal.user.id == current_user.id
        # @user = @goal.user
        # binding.pry
        # authorized
        #@goal = Goal.find(params[:id])
    end

    def update
        #@goal = Goal.find(params[:id])
        @goal.update(goal_params)
        redirect_to goal_path(@goal)
    end

    def destroy
        #@goal = Goal.find(params[:id]).destroy
        @goal.destroy
        redirect_to goals_path
    end

    def welcome
        @ffg10 = Goal.fulfilled10
        @randomcomments = Comment.randcoms
    end

    private

    def find_goal
        @goal = Goal.find(params[:id])
    end

    def goal_params
        params.require(:goal).permit(:content, :details, :achieved, :month, :user_id, :category_id)
    end

    def authorized_goals
        #binding.pry
        redirect_to goals_path unless logged_in? && @goal.user.id == current_user.id
    end

end
