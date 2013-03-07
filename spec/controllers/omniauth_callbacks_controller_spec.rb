require 'spec_helper'

describe OmniauthCallbacksController do

  let(:user) { FactoryGirl.create :user }
  
  before do
    @response.env["devise.mapping"] = Devise.mappings[:user]
  end

  it 'signs in an user' do
    User.stub(:by_facebook).and_return(user)
    get :facebook
    response.should redirect_to(root_path)
    flash.empty?.should eq true
  end

  it 'returns an error' do
    User.stub(:by_facebook).and_return(nil)
    get :facebook
    response.should redirect_to(root_path)
    flash.empty?.should eq false
  end
end
