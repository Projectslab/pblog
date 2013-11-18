class UsersController < ApplicationController
  def new
    redirect_to profile_path unless User.count.zero?
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to profile_path
    else
      render 'new'
    end
  end

  def profile
    @user = User.first
  end

  def super_delete
    User.destroy_all
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
