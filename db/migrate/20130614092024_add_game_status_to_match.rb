class AddGameStatusToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :game_status, :string
  end
end
