class AddScoreGToPartThreePredict < ActiveRecord::Migration
  def change
    add_column :part_three_predicts, :score_g, :integer
  end
end
