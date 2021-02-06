class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user
      log_in @user
      flash[:notice] = 'logged in with success'
      redirect_to user_path(current_user)
    else
      flash.now[:alert] = 'invalid username'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Logged out'
    redirect_to login_path
  end
end
