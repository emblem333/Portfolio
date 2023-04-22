class CreateTagMaps < ActiveRecord::Migration[6.1]
  def change

    # TODO : SQLiteでは、デフォルトでは外部キーを使用できませんのでご注意ください

    create_table :tag_maps do |t|
      # Postと関連付ける
      #   references型を使用して予想外のidが入らないようにする
      t.integer :hobby_id
      # Tagと関連付けるためのカラム
      #   references型を使用して予想外のidが入らないようにする
      t.integer :tag_id
      t.timestamps
    end
  end
end
