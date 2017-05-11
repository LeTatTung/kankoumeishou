class Category < ApplicationRecord
  has_many :images, dependent: :destroy

  validates :name, presence: true
  class << self
    def search data
      data = data.downcase
      Category.where "lower(name) LIKE ?", "%#{data}%"
    end
  end
end
