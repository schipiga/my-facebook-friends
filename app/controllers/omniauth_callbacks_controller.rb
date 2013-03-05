class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    user = User.by_facebook request.env["omniauth.auth"]
    sign_in user
  end
end
