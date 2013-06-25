class AddScoreBToPartThreePredict < ActiveRecord::Migration
  def change
    add_column :part_three_predicts, :score_b, :integer
  end
end
