class CommentsController < ApplicationController

    def index
        @comments = Comment.all
        @comments_count = Comment.count
    end

    def new
#binding.pry
    end

    def create

    end

    def show
        @comment = Comment.find(params[:id])
    end

    def edit

    end

    def update

    end

    def destroy

    end

end
