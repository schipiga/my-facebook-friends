class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    user = User.by_facebook request.env["omniauth.auth"]
    if user
      sign_in user
    else
      flash[:error] = 'Invalid facebook account'
    end
    redirect_to root_path
  end
end
