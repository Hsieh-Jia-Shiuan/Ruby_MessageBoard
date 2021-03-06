class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:successlogin] = "Welcome to #{@user.name} message board!"
      redirect_to root_path
    else
      flash[:errorregister] = "Please enter your name or password!"
      #binding.pry
      redirect_to register_path
      #render template: "users/new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end