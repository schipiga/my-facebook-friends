FactoryGirl.define do
  factory :user do
    email                      'user@example.com'
    password                   12345678
    facebook_id                12345678
    facebook_credentials_token 12345678
  end
end
