require 'spec_helper'

describe UsersController do
  render_views

  let(:user) { FactoryGirl.create :user }
  let(:friends) { [{ name: 'Iron Arny' }] }

  it 'redirects to login page' do
    get :show
    response.should redirect_to(new_user_session_path)
  end

  it 'shows friends' do
    User.any_instance.stub(:facebook_friends).and_return(friends)
    sign_in user
    get :show
    response.should render_template('show')
    response.body.should include('Iron Arny')
  end
end
