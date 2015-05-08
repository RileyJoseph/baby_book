class AuthController < ApplicationController

 def callback
    provider_user = request.env['omniauth.auth']
    # render json: provider_user
    #find or create user
    @user = User.find_or_create_by(provider_id:provider_user['uid'],provider:params[:provider]) do |u|
      u.provider_hash = provider_user['credentials']['token']
      u.name = provider_user['info']['name']
      u.email = provider_user['info']['email']
      u.password_digest = "fb_login"
      u.save
      # ^ found in json version of user info
    end
    # render json: @user
    #start session
    session[:user_id] = @user.id
    session[:provider_id] = @user.provider_id
    session[:password_digest] = @user.password_digest
    #send them home
    # render json: session
    redirect_to babies_path
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  def failure
    #todo, display error page
    render plain: "this aint right!?"
  end

end