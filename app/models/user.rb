class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  def self.by_facebook auth
    unless user = self.find_by_facebook_id auth.id.to_s
      user_attr = {
        email: auth.info.email.to_s
        password: Devise.friendly_token[0,20]
        facebook_id: auth.id
      }
      user = self.create! user_attr
    end
  end
end
