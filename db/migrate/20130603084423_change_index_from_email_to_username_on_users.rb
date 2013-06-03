class ChangeIndexFromEmailToUsernameOnUsers < ActiveRecord::Migration
  def up
    remove_index :users, :email
    add_index :users, :name
  end

  def down
    add_index :users, :email
    remove_index :users, :name
  end
end
