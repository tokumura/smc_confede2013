class AddScoreEToPartThreePredict < ActiveRecord::Migration
  def change
    add_column :part_three_predicts, :score_e, :integer
  end
end
