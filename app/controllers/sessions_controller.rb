class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_url
  end

  def destroy
    sign_out
    raise "pepe"
    redirect_to root_url
  end

  def new
    redirect_to '/users/auth/facebook'
  end
end