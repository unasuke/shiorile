class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.create_with_omniauth(auth)
    @user = User.new(
                  name: auth['info']['name'],
                  provider: auth['provider'],
                  uid: auth['uid'],
                  email: "#{auth.uid}-#{auth.provider}@example.com",
                  password: Devise.friendly_token
                  )
    @user.save
    @user
  end

end
