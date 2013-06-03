class AddUserIdToPartOnePredict < ActiveRecord::Migration
  def change
    add_column :part_one_predicts, :user_id, :integer
  end
end
