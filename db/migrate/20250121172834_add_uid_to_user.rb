class AddUidToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :doorkeeper_access_token, :string
    add_column :users, :doorkeeper_refresh_token, :string
    add_column :users, :doorkeeper_expires_at, :datetime
  end
end
