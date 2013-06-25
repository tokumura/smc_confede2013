class AddScoreAToPartThreePredict < ActiveRecord::Migration
  def change
    add_column :part_three_predicts, :score_a, :integer
  end
end
