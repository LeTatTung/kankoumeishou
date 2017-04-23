class Image < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :category


  validates :user_id, presence: true
  validates :category_id, presence: true

  validates :user, presence: true
  validates :address, presence: true
  validates :category, presence: true
  validates :image, presence: true

end
