class LikeImage < ApplicationRecord
    belongs_to :user
    belongs_to :image
    validates :user_id, presence: true
    validates :image_id, presence: true
end
