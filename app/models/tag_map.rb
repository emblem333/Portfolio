class TagMap < ApplicationRecord
  # tag_mapsテーブルは、postsテーブルとtagsテーブルに属している
  belongs_to :hobby
  belongs_to :tag

  # 念のためのバリデーション
  validates :hobby_id, presence: true
  validates :tag_id, presence: true
end
