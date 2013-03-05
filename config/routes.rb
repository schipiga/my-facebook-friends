MyFacebookFriends::Application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'omniauth_callbacks'
  }

  resource :user, only: :show

  root to: 'users#show'
end
