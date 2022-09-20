class UsersController < ApplicationController
    before_action :require_logged_out, only: [:new, :create]
    
    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user && @user.save
            redirect_to new_session_url
        else
            render :new
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end
end
