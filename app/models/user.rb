class User < ApplicationRecord
  has_one :auth

  def self.create_with_omniauth(authenticate)
    user = User.create!
    Auth.create!(
      user_id:      user.id,
      provider:     authenticate['provider'],
      uid:          authenticate['uid'],
      screen_name:  authenticate['info']['nickname'],
      name:         authenticate['info']['name'],
    )
  end
end
