class Hobby < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :genre
  has_many :favorites, dependent: :destroy
  has_many :hobby_comments, dependent: :destroy
  has_many :tag_maps, dependent: :destroy, foreign_key: 'hobby_id'
  has_many :tags, through: :tag_maps

  has_one_attached :image
  validate :image

  def favorited?(user)#「ログイン中のユーザーがその投稿に対していいねをしているか」を判断
    favorites.where(user_id: user.id).exists?
  end

  def get_image(*size)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no-image.png')
      image.attach(io: File.open(file_path), filename: 'no-image.png', content_type: 'image/png')
    end
    if !size.empty?
      image.variant(resize: size)
    else
      image
    end
  end

  #タグ
  def save_tags(tags)

    tag_list = tags.split(/[[:blank:]]+/)
    current_tags = self.tags.pluck(:name)
    old_tags = current_tags - tag_list
    new_tags = tag_list - current_tags

    p current_tags

    old_tags.each do |old|
      self.tags.delete Tag.find_by(name: old)
    end

    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(name: new)
      self.tags << new_post_tag
    end
  end

  private
    def image_type
    if !image.blob
      errors.add(:image, 'をアップロードしてください')
    elsif !image.blob.content_type.in?(%('image/jpeg image/png'))
      errors.add(:image, 'はJPEGまたはPNG形式を選択してアップロードしてください')
    end
    end
end
