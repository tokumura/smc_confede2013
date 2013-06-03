class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :game_no
      t.string :team_a
      t.integer :score_a
      t.string :team_b
      t.integer :score_b

      t.timestamps
    end
  end
end
