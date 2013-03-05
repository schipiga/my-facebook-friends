class AddFacebookCredentialsTokenColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :facebook_credentials_token, :string
  end
end
