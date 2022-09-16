class UsersController < ApplicationController

    def index
        if params[:username]
            @users = User.find_by(username: params[:username])
        else
            @users = User.all
        end
        render json: @users
    end

    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user
        else
            render json: @user.errors.full_messages, status: 402
        end
    end

    def show
        @user = User.find_by(id: params[:id])
        render json: @user
    end

    def update
        @user = User.find_by(id: params[:id])
        if @user.update(user_params)
            render json: @user
        else
            render json: @user.errors.full_messages, status: 420
        end

    end

    def destroy
        @user = User.find_by(id: params[:id])
        if @user.destroy
            render json: ["This user be gone"]
        else
            render json: ['Mission failed, return to base']
        end
    end


    private

    def user_params
        params.require(:user).permit(:username)
    end
end
