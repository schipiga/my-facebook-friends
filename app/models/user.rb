class User < ActiveRecord::Base

  devise :database_authenticatable,
         :registerable,
         :omniauthable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  attr_accessible :email,
                  :password,
                  :password_confirmation,
                  :remember_me,
                  :facebook_id,
                  :facebook_credentials_token

  validates_presence_of :facebook_id,
                        :facebook_credentials_token

  def self.by_facebook auth
    unless user = self.find_by_facebook_id(auth[:uid])
      user = self.create attributes_from(auth)
    end
    return user
  end

  def facebook_friends
    graph = Koala::Facebook::API.new facebook_credentials_token
    fb_friends = graph.get_connections 'me', 'friends'
    fb_friends.map { |friend| friend['name'] }
  end

  protected

  def self.attributes_from auth
    info = auth.extra.raw_info
    {
      email: info.email,
      password: Devise.friendly_token[0,20],
      facebook_id: info.id,
      facebook_credentials_token: auth.credentials.token
    }
  end
end
