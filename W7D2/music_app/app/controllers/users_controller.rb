class UsersController < ApplicationController

    def show
        @user = User.find_by(id: params[:id])
        render :show
    end

    def new
        @user = User.new
        render :sign_up
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login!(@user)
            redirect_to user_url(@user)
        else
            render :sign_up
        end


    end

    private
    def user_params
        params.require(:user).permit(:email, :password)
    end

end
