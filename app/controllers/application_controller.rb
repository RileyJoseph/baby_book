class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :current_user

  def is_authenticated?
    unless current_user
      flash[:danger] = "You are not logged in"
      redirect_to login_path
    end
  end

  def current_user
    # logic for standard auth vs. facebook auth
    if User.find_by_id(session[:password_digest]) != "fb_login"
      @current_user ||= User.find_by_id(session[:user_id])
    else
      @current_user ||= User.find_by_provider_id(session[:provider_id])
    end
  end

end