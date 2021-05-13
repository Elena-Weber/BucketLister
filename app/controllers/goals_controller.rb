class GoalsController < ApplicationController

    def index
        @goals = Goal.all
        @goals_count = Goal.count
    end

    def show
        @goal = Goal.find(params[:id])
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
            redirect_to user_goals_path(current_user, @goal)
        else
           redirect_to :new
        end
    end

    def edit
        @goal = Goal.find(params[:id])
    end

    def update
        @goal = Goal.find(params[:id])
        @goal.update(goal_params)
        redirect_to goal_path(@goal)
    end

    def destroy
        @goal = Goal.find(params[:id]).destroy
        redirect_to goals_path
    end

    private

    def goal_params
        params.require(:goal).permit(:content, :details, :achieved, :month, :user_id, :category_id)
    end

end
