class GoalsController < ApplicationController

    def index
        @goals = Goal.all
        @goals_count = Goal.count
    end

    def new

    end

    def create

    end

    def show
        @goal = Goal.find(params[:id])
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
        params.require(:goal).permit(:content, :details, :achieved, :month, category_ids: [])
    end


end
