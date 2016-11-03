class SessionsController < ApplicationController
  def create
    authenticate = request.env['omniauth.auth']
    user = Auth.find_by(
      provider: authenticate['provider'],
      uid:      authenticate['uid'],
    ).try(:user) || User.create_with_omniauth(authenticate)
  end

  def destroy
    log_out
  end
end
