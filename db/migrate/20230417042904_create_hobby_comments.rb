class CreateHobbyComments < ActiveRecord::Migration[6.1]
  def change
    create_table :hobby_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :hobby_id

      t.timestamps
    end
  end
end
