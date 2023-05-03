class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.string :name# 実際のタグの名前
      t.string :vision

      t.timestamps
    end
  end
end
