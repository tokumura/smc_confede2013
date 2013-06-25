class AddScoreFToPartThreePredict < ActiveRecord::Migration
  def change
    add_column :part_three_predicts, :score_f, :integer
  end
end
