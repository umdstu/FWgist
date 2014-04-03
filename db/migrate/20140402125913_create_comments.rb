class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :user_id
      t.string :permissions
      t.text :comment
      t.integer :gist_id
      t.timestamps
    end
  end
end
