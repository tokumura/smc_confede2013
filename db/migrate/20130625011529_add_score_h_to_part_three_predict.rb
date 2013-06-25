class AddScoreHToPartThreePredict < ActiveRecord::Migration
  def change
    add_column :part_three_predicts, :score_h, :integer
  end
end
