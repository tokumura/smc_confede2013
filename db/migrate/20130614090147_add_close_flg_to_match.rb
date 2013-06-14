class AddCloseFlgToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :close_flg, :boolean
  end
end
