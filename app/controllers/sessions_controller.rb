class SessionsController < ApplicationController

  def create
    auth = request.env['omniauth.auth']
    user = User.find_by(provider: auth['provider'], uid: auth['uid']) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to '/', notice: "sign in"
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/', notice: "sign out"
  end
end
