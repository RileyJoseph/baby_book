class UsersController < ApplicationController

  # render signup page (GET)
  def new
  end

  # create new user (POST)
  def create
    User.create(user_params)
    redirect_to login_path
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:password)
  end


end