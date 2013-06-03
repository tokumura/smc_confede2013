class AddFlagToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :flag_a, :string
    add_column :matches, :flag_b, :string
  end
end
