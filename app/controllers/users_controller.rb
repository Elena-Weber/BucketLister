class UsersController < ApplicationController

    # what to do before displaying the whole page
    before_action :find_user, only: [:show, :update, :destroy]
    before_action :authorized_users, only: [:edit, :update, :destroy]

    def index # display all users
        @users = User.all
    end

    def show
    end

    def new # creating new user from form
        @user = User.new
    end

    def create # saving new user and setting up session
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def edit
    end

    def update # edit user
        @user.update(user_params)
        redirect_to user_path(@user)
    end

    def destroy # delete user
        @user.destroy
        redirect_to users_path
    end

    private 

    def find_user # find user
        @user = User.find_by_id(params[:id])
    end

    def user_params # allowed user params
        params.require(:user).permit(:username, :location, :email, :password, :password_confirmation)
    end

    def authorized_users # checking user authorization
        @this_user = User.find_by_id(params[:id])
        redirect_to goals_path unless logged_in? && @this_user.id == current_user.id
    end

end