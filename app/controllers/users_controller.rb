class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      # flash tells the system to display this for only one request
      flash[:success] = "Welcome to the Sample App"
      redirect_to @user
      # redirect_to user_path(@user) also can
    else
      render 'new', status: :unprocessable_entity
    end
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
