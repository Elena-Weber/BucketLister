class UsersController < ApplicationController

    before_action :find_user, only: [:show, :update, :destroy]
    before_action :authorized_users, only: [:edit, :update, :destroy]

    def index
        @users = User.all
    end

    def show
        #@user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def edit
        #binding.pry
        #@user = User.find_by_id(params[:id])

        # if @user(params[:id]) != current_user.id
        #     redirect_to users_path
        # end
        
    end

    def update
        #@user = User.find_by_id(params[:id])
        @user.update(user_params)
        redirect_to user_path(@user)
    end

    def destroy
        #@user = User.find_by_id(params[:id])
        @user.destroy
        redirect_to users_path
    end

    private 

    def find_user
        @user = User.find_by_id(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :location, :email, :password, :password_confirmation)
    end

    def authorized_users
        @user = User.find_by_id(params[:id])
        #binding.pry
        redirect_to goals_path unless logged_in? && @user.id == current_user.id
        #binding.pry
    end

end