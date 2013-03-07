require 'spec_helper'

describe User do

  let(:user) { FactoryGirl.create :user }
  let(:user_attr) { FactoryGirl.attributes_for :user }
  let(:friends) { [{ name: 'Friend#1' },{ name: 'Friend#2' }] }

  it { should validate_presence_of :facebook_id }
  it { should validate_presence_of :facebook_credentials_token }

  it 'finds user by facebook' do
    result = User.by_facebook({ uid: user.facebook_id })
    result.should eq user
  end

  it 'creates user by facebook' do
    User.stub(:attributes_from).and_return(user_attr)
    User.by_facebook({ uid: 'no_id' })
    User.count.should eq 1
  end

  it 'returns friends list' do
    Koala::Facebook::API.any_instance.stub(:get_connections).and_return(friends)
    user.facebook_friends.count.should eq 2
  end
end
