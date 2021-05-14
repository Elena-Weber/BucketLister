class ApplicationController < ActionController::Base

    helper_method :logged_in?, :current_user

    def current_user
        @user = User.find_by_id(session[:user_id])
    end

    def logged_in?
        !current_user.nil?
    end

    #def authorized
        #redirect_to goals_path unless logged_in? && @user[:id] == current_user.id
        #@user = User.find_by_id(params[:id])
        #binding.pry
        #redirect_to goals_path unless logged_in? && @user.id == current_user.id
        #binding.pry
    #end

end
