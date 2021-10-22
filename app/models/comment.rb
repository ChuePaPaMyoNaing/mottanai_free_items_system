class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :description, presence: true, length: { maximum: 300 }
end
