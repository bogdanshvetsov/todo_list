class UsersController < ApplicationController

  def new
    redirect_to root_url if signed_in?
    @user = User.new
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_to root_url 
    else 
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
