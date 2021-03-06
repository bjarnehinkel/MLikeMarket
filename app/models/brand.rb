class Brand < ApplicationRecord
  # has_one_attached :cardcover
  # has_one_attached :banner
  # has_many_attached :photos

  has_many :brand_images, dependent: :destroy
  has_many :categorys, dependent: :destroy
  has_many :products, dependent: :destroy

  def self.make_fav
    normals = Brand.all.where("status = 'normal'")
    Brand.reset_status
    new_fav = normals.sample
    new_fav.status = 'fav'
    new_fav.save
  end

  def self.reset_status
    Brand.all.each do |brand|
      brand.status = 'normal'
      brand.save
    end
  end
end
