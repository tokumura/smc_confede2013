class AddUserIdToPartThreePredict < ActiveRecord::Migration
  def change
    add_column :part_three_predicts, :user_id, :integer
  end
end
