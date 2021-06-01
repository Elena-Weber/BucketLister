class GoalsController < ApplicationController

    before_action :find_goal, only: [:show, :edit, :update, :destroy]
    before_action :authorized_goals, only: [:edit, :update, :destroy]

    def index

        @user = User.find_by_id(params[:user_id])
        @categories = Category.all.order('name ASC')
        @goals = Goal.all
        if !params[:category].blank? && !params[:achieved].blank?
            if params[:achieved] == "Achieved"
                @goals = Goal.in_category(params[:category]).true_achieved
            elsif params[:achieved] == "Not achieved yet"
                @goals = Goal.in_category(params[:category]).false_achieved
            end
        elsif !params[:category].blank? && params[:achieved].blank?
            @goals = Goal.in_category(params[:category])
        elsif params[:category].blank? && !params[:achieved].blank?
            if params[:achieved] == "Achieved"
                @goals = Goal.true_achieved
            elsif params[:achieved] == "Not achieved yet"
                @goals = Goal.false_achieved
            end
        end
    end

    def search
        if params[:search].blank?  
            redirect_to(goals_path, alert: "Empty field!") #and return  
        else
            search_term = params[:search].downcase.gsub(/\s+/, "")
            @goals = Goal.all.select { |g|
            g.content.downcase.include?(search_term) ||
            g.details.downcase.include?(search_term)
        }
        end
    end

    def show
        @user = User.find_by_id(params[:user_id])
        @comment = Comment.find_by_id(params[:user_id])
    end

    def new
        @goal = Goal.new
    end

    def create
        @goal = current_user.goals.build(goal_params)
        if @goal.save
            redirect_to user_goal_path(current_user, @goal)
        else
            render 'goals/new'
        end
    end

    def edit
    end

    def update
        @goal.update(goal_params)
        redirect_to goal_path(@goal)
    end

    def destroy
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
        redirect_to goals_path unless logged_in? && @goal.user.id == current_user.id
    end

end
