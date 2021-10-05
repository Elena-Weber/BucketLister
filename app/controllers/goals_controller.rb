class GoalsController < ApplicationController

    # what to do before displaying goals
    before_action :find_goal, only: [:show, :edit, :update, :destroy]
    before_action :authorized_goals, only: [:edit, :update, :destroy]

    def index # displaying goals with filtering

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

    def search # searching for a goal
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

    def show # display one goal
        @user = User.find_by_id(params[:user_id])
        @comment = Comment.find_by_id(params[:user_id])
    end

    def new # create new goal from form
        @goal = Goal.new
    end

    def create # saving new goal to db
        @goal = current_user.goals.build(goal_params)
        if @goal.save
            redirect_to user_goal_path(current_user, @goal)
        else
            render 'goals/new'
        end
    end

    def edit
    end

    def update # editing a goal
        @goal.update(goal_params)
        redirect_to goal_path(@goal)
    end

    def destroy # deleting a goal
        @goal.destroy
        redirect_to goals_path
    end

    def welcome # variables for welcome page
        @ffg10 = Goal.fulfilled10
        @randomcomments = Comment.randcoms
    end

    private

    def find_goal # finding a goal
        @goal = Goal.find(params[:id])
    end

    def goal_params # what goal parameters are allowed
        params.require(:goal).permit(:content, :details, :achieved, :month, :user_id, :category_id)
    end

    def authorized_goals # users only allowed to edit/delete their own goals
        redirect_to goals_path unless logged_in? && @goal.user.id == current_user.id
    end

end
