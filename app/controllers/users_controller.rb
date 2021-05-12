class UsersController < ApplicationController

    def index
        @users = User.all
        @users_count = User.count
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

    def show
        @user = User.find(params[:id])
    end

    def edit
    end

    def update
        @user.update(user_params)
        redirect_to user_path(@user)
    end

    def destroy
        @user.destroy
        redirect_to users_path
    end

    private 

    # def find_user
    #     @user = User.find_by_id(params[:id])
    # end

    def user_params
        params.require(:user).permit(:username, :location, :email, :password, :password_confirmation
            #, outfits_attributes: [:name, :heat, :price, :times_worn]
        )
    end

end
