class Product < ApplicationRecord
  # has_many_attached :photos

  belongs_to :brand
  belongs_to :category
end
