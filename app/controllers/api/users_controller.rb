module Api
  class UsersController < ApplicationController
    def index
      @users = User.all
      render json: @users
    end

    def create
    
      @user = User.create(user_params)
      if @user.valid?
        token = encode_token({user_id: @user.id})
        #AccountMailer.notify(@user).deliver!
        render json: {user: @user, token: token}, status: :created

      else
        render json: {message: "Invalid username or password"}, status: :not_acceptable
      end
    end

    def login
      #@user = User.find_by(username: user_params[:username])
      @user = User.where("username = ?", user_params[:username])

      if @user and @user.authenticate(user_params[:password])
        token = encode_token({user_id: @user.id})
        render json: {user: @user, token: token, message: "User Logged in."}, status: :accepted
      else
        render json: {message: "Invalid username or password"}, status: :not_acceptable
      end
    end
    
    private
    def user_params
      params.require(:user).permit(:username, :password, :email)
    end
  end
end