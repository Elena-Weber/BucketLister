class Admin::StatsController < ApplicationController
    def index
        @categories_count = Category.count
        @goals_count = Goal.count
        @users_count = User.count
        @comments_count = Comment.count
        @first_gs = Goal.first_goals
        @latest_gs = Goal.latest_goals
        @ffg = Goal.fulfilled
        @unffg = Goal.unfulfilled
    end
end