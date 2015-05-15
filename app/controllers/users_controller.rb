class UsersController < ApplicationController

  # render signup page (GET)
  def new
  end

  # create new user (POST)
  def create
    @user = User.create(user_params)

    # auto login after create user
    session[:user_id] = @user.id
    session[:password_digest] = @user.password_digest
    flash[:success] = "Welcome new member!"
    redirect_to babies_path
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:password)
  end
end