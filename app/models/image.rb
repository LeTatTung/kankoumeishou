class Image < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :category

  validates :user, presence: true
  validates :address, presence: true
  validates :category, presence: true
  validates :image, presence: true
end
