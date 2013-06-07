class AddClosingdayToPartOnePredict < ActiveRecord::Migration
  def change
    add_column :part_one_predicts, :closingday, :string
  end
end
