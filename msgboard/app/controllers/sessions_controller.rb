class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:name])

    if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        flash[:successlogin] = "Welcome to #{user.name} message board!"

        redirect_to root_path
    else
      flash[:errorlogin] = "Please chech your name or password!"

      redirect_to login_path
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end