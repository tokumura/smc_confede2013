class AddScoreDToPartThreePredict < ActiveRecord::Migration
  def change
    add_column :part_three_predicts, :score_d, :integer
  end
end
