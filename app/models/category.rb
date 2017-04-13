class Category < ApplicationRecord
  has_many :images, dependent: :destroy
end
