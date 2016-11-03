class SessionsController < ApplicationController
  def create
    authenticate = request.env['omniauth.auth']
    user = Auth.find_by(
      provider: authenticate['provider'],
      uid:      authenticate['uid'],
    ).try(:user) || User.create_with_omniauth(authenticate)
    redirect_to '/'
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
