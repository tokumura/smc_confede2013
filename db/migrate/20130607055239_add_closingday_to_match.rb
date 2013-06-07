class AddClosingdayToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :closingday, :string
  end
end
