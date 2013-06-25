class AddScoreCToPartThreePredict < ActiveRecord::Migration
  def change
    add_column :part_three_predicts, :score_c, :integer
  end
end
