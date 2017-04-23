class Image < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  belongs_to :user
  belongs_to :category

  has_many :comment, -> { order "created_at DESC"}
  
  validates :user, presence: true
  validates :address, presence: true
  validates :category, presence: true
  validates :image, presence: true
end
