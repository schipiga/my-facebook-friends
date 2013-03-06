class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @friends = current_user.facebook_friends
  end
end
