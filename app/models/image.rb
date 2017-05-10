class Image < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :comments, dependent: :destroy
  has_many :like_images, dependent: :destroy
  validates :user, presence: true
  validates :address, presence: true
  validates :category, presence: true
  validates :image, presence: true
  validate :picture_size

  scope :order_by_created_at, ->{order created_at: :desc}
  scope :search_address, -> key{where("address LIKE ? OR description LIKE ?", "%#{key}%", "%#{key}%") if key.present?}
  scope :images_feed, ->user{where user_id: user.following_ids << user.id}
  scope :popular_images, -> {order like_number: :desc, id: :desc}

  mount_uploader :image, ImageUploader

  def main_comments
    comments.where(parent_id: nil).order id: :desc
  end

  private
  def picture_size
    if image.size > 5.megabytes
      errors.add :picture, I18n.t("warning-max-size")
    end
  end
end
