class Item < ApplicationRecord
  has_many :comments, dependent: :destroy
  mount_uploader :image, ImageUploader
  taked :intger
  validates :name, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 200 }
end
