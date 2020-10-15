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
    brand = Brand.new(name: row[0],
                      slogan: row['slogan'],
                      description: row['description'],
                      compliment: row['compliment'],
                      cardcover: row['cardcover'])
    unless row['status'].nil?
      brand.status = row['status']
    end
    brand.save!
  end
end

def createCatAssignBrand
  CSV.foreach(Rails.root.join('lib', 'seeds', 'categories.csv'), CSVOPTIONS) do |row|
    cat = Category.new(name: row[0])
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
        prodImg = ProductImage.new(name: "#{prod.name}_#{index + 1}",
                          link: link)
        prodImg.product = prod
        prodImg.save!
      end
    end
    prod.save!
  end
end

# puts "deleting brands"

# Brand.destroy_all
# puts "done"

# puts "deleting categories"
# Category.destroy_all
# puts "done"

# puts "deleting products"

# ProductImage.destroy_all
# Product.destroy_all
# puts "done"

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
