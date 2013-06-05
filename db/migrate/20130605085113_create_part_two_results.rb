class CreatePartTwoResults < ActiveRecord::Migration
  def change
    create_table :part_two_results do |t|
      t.string :team_a
      t.string :team_b
      t.string :team_c
      t.string :team_d

      t.timestamps
    end
  end
end
