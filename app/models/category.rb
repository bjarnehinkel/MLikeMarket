class Category < ApplicationRecord
  belongs_to :brand
  has_many :products, dependent: :destroy
end
