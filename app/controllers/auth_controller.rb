class AuthController < ApplicationController

# Oauth login for Facebook

  def callback
    # get user_facebook info
    provider_user = request.env['omniauth.auth']

    # find or create user
    user = User.find_or_create_by(provider_id:provider_user['uid'],provider:params[:provider]) do |u|
      u.provider_hash = provider_user['credentials']['token']
      u.name = provider_user['info']['name']
      u.email = provider_user['info']['email']
      # for current_user logic
      u.password_digest = "fb_login"
      u.save
    end

    #start session
    session[:user_id] = user.id
    session[:provider_id] = user.provider_id
    session[:password_digest] = user.password_digest

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