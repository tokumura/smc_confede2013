class CreatePartThreePredicts < ActiveRecord::Migration
  def change
    create_table :part_three_predicts do |t|
      t.string :team_a
      t.string :team_b
      t.string :team_c

      t.timestamps
    end
  end
end
