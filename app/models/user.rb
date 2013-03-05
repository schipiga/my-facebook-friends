class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :facebook_id
  # attr_accessible :title, :body

  def self.by_facebook auth
    info = auth.extra.raw_info
    unless user = self.find_by_facebook_id(info.id)
      user = self.create! attributes_from(info)
    end
    return user
  end

  protected

  def attributes_from omniauth
    {
      email: omniauth.email,
      password: Devise.friendly_token[0,20],
      facebook_id: omniauth.id
    }
  end
end
