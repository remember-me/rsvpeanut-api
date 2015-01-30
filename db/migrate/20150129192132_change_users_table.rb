class ChangeUsersTable < ActiveRecord::Migration
  def change
    remove_column :users, :username
    add_column :users, :first, :string
    add_column :users, :last, :string
    add_column :users, :email, :string
  end
end
