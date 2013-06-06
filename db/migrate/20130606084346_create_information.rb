class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.string :title
      t.text :infobody
      t.string :informant

      t.timestamps
    end
  end
end
