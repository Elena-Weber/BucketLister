class CommentsController < ApplicationController

    def index
        @comments = Comment.all
        @comments_count = Comment.count
    end

    def new

    end

    def create

    end

    def show

    end

    def edit

    end

    def update

    end

    def destroy

    end

end
