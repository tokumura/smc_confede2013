class AddDoneToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :done, :boolean
  end
end
