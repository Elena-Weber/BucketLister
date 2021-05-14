class Admin::StatsController < ApplicationController
    def index
        @categories_count = Category.count
        @goals_count = Goal.count
        @users_count = User.count
        @comments_count = Comment.count
    end
end