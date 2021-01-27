class UsersController < ApplicationController
  def new
    @user= User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
    log_in @user
      flash[:success] = 'user successfully created'
      redirect_to @user
    else
      flash.now[:error] = "Error: #{@user.errors.full_messages.join(', ')}"
      render 'new'
    end
  end
  def show
    @user=User.find(params[:id])
  end
  private
  def user_params
  params.require(:user).permit(:username,:avatar)
  end
end