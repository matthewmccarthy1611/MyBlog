class SessionsController < ApplicationController

    def home
    end

    def destroy
        session.clear
        redirect_to '/'
    end

    def new
    end

    def create
        # binding.pry
        user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash[:alert] = "Incorrect login info"
            redirect_to '/login'
        end
    end

    def google
        # @user = User.find_by_or_create_by(email:) do |user|
        binding.pry
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end
