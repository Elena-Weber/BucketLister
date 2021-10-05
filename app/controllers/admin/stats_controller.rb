class Admin::StatsController < ApplicationController
    # set variables for admin page
    def index 
        @users = User.all
        @categories = Category.all
        @goals = Goal.all
        @comments = Comment.all
        @first_gs = Goal.first_goals
        @latest_gs = Goal.latest_goals
        @ffg = Goal.fulfilled
        @unffg = Goal.unfulfilled
    end
end