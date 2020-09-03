# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
require 'open-uri'
require 'resolv-replace'
CSVOPTIONS = { col_sep: ';', headers: :first_row }

def formatName(name)
  words = name.split(" ")
  words.join('_')
end

def createBrand
  CSV.foreach(Rails.root.join('lib', 'seeds', 'brands.csv'), CSVOPTIONS) do |row|
    brand = Brand.new(name: row['name'],
                      slogan: row['slogan'],
                      description: row['description'],
                      compliment: row['compliment'])
    brand_cardcover = URI.open(row['cardcover'])
    brand.cardcover.attach(io: brand_cardcover, filename: "#{brand.name}_cardcover.jpg", content_type: 'image/jpg')
    brand.save!
  end
end

def createCatAssignBrand
  CSV.foreach(Rails.root.join('lib', 'seeds', 'categories.csv'), CSVOPTIONS) do |row|
    cat = Category.new(name: row['name'])
    cat.brand = Brand.find(row['brand_id'].to_i)
    cat.save!
  end
end

def createProdAssignCatBrand
  CSV.foreach(Rails.root.join('lib', 'seeds', 'products.csv'), CSVOPTIONS) do |row|
    prod = Product.new(name: row[0],
                       price: row['price'].to_f,
                       description: row['description'])
    prod.brand = Brand.find(row['brand_id'].to_i)
    prod.category = Category.find(row['category_id'].to_i)
    unless row['image_links'].nil?
      image_links = row['image_links'].split(', ')
      image_links.each_with_index do |link, index|
        pic = URI.open(link)
        _name = formatName(prod.name)
        prod.photos.attach(io: pic, filename: "#{_name}_#{index + 1}.png", content_type: 'image/png')
      end
    end
    prod.save!
  end
end

puts "deleting brands"
Brand.all.each do |brand|
  brand.photos.each do |photo|
    photo.purge
  end
end

Brand.destroy_all
puts "done"

puts "deleting categories"
Category.destroy_all
puts "done"

puts "deleting products"
Product.all.each do |product|
  if product.photos.attached?
    product.photos.each do |photo|
      photo.purge
    end
  end
end

Product.destroy_all
puts "done"

puts "creating brands"
createBrand()
puts "done"


puts "creating categories"
createCatAssignBrand()
puts "done"

puts "creating products"
createProdAssignCatBrand()
puts "done"

puts "finished"
