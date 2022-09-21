class SessionsController < ApplicationController
    def new
        @User = User.new
        render :log_in
    end

    def create
        @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
        if @user 
            login!(@user)
            redirect_to user_url(@user)
        else
            render :log_in
        end
    end

    def destroy
        logout!
        redirect_to new_session_url
    end

end
