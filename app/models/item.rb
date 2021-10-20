class Item < ApplicationRecord
  has_many :comments, dependent: :destroy
  mount_uploader :image, ImageUploader
  validates :name, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 200 }  
  validates :upload_date, presence: true
  validate  :image_size

  private
    # アップロードされた画像のサイズをバリデーションする
    def image_size
      if image.size > 5.megabytes
        errors.add(:image, "should be less than 5MB")
      end
    end
end
