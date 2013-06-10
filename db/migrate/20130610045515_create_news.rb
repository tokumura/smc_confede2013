class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :news_body

      t.timestamps
    end
  end
end
