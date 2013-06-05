class AddTotalPointToUser < ActiveRecord::Migration
  def change
    add_column :users, :total_point, :integer
  end
end
