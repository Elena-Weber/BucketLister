class CategoriesController < ApplicationController

    def index # display all categories
        @categories = Category.all.order('name ASC')
    end

    # def new
    # end

    # def create
    # end

    def show # display one category
        @category = Category.find(params[:id])
    end

    # def edit
    # end

    # def update
    # end

    # def destroy
    # end

end
