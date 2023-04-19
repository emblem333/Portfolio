class RemoveTitleFromHobbies < ActiveRecord::Migration[6.1]
  def change
    remove_column :hobbies, :title, :string
    remove_column :hobbies, :content, :text
  end
end
