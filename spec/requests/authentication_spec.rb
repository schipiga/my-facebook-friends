require 'spec_helper'

describe 'authentication', request: true do
  let(:friends) { [{ name: 'Iron Arny' }] }

  it 'logs in to app' do
    User.any_instance.stub(:facebook_friends).and_return(friends)
    visit '/'
    click '.fb_login'
    page.body.should include('Iron Arny')
  end
end
