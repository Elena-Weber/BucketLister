class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        if auth = request.env["omniauth.auth"]
            @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.username = auth['info']['name']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(10)
            end
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            @user = User.find_by(username: params[:username])
            if @user && @user.authenticate(params[:password])
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else
                flash.now[:alert] = "Oops... Something's wrong. Please make sure your username and/or password are correct."
                render 'sessions/new'
            end
        end
    end

    def destroy
        session.clear
        flash[:notice] = "You've successfully logged out."
        redirect_to login_path
    end

private

    def auth
        request.env['omniauth.auth']
    end
end