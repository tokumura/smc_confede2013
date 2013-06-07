class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :information_id
      t.text :comment_body
      t.integer :comment_user_id

      t.timestamps
    end
  end
end
