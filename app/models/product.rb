class Product < ApplicationRecord
  # has_many_attached :photos

  has_many :product_images, dependent: :destroy
  belongs_to :brand
  belongs_to :category
end
