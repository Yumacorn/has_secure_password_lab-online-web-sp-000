class UsersController < ApplicationController
    def create
        @user = User.new
        @user.name = params[:user][:name]
        @user.password = params[:user][:password]

        if @user.save && params[:user][:password] == params[:user][:password_confirmation]
            session[:user_id] = @user.id
            redirect_to users_path(@user)
        else
            redirect_to new_user_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
