class CreatePartOnePredicts < ActiveRecord::Migration
  def change
    create_table :part_one_predicts do |t|
      t.integer :game_no
      t.integer :score_a
      t.integer :score_b

      t.timestamps
    end
  end
end
