class Hobby < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :genre
  has_one_attached :image
  validate :image_type

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

  private
    def image_type
    if !image.blob
      errors.add(:image, 'をアップロードしてください')
    elsif !image.blob.content_type.in?(%('image/jpeg image/png'))
      errors.add(:image, 'はJPEGまたはPNG形式を選択してアップロードしてください')
    end
    end
end
