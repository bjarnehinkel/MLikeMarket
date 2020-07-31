# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'resolv-replace'

def createCatAssignBrand(cat, brand)
  newCat = Category.new(name: cat)
  newCat.brand = brand
  newCat.save!
end

def createProdAssignCatBrand(prod, cat, brand)
  newProd = Product.new(name: prod[0], price: prod[1])
  newProd.brand = brand
  newProd.category = cat
  newProd.save!
end

brands = []
puts "deleting brands"
Brand.destroy_all
puts "done"

puts "creating brands"
gp = Brand.new(name: 'Greg Pier',
               slogan: 'The creation of new clothing lines, singular and refined, inspired by architecture and contemporary art. Greg Pier collections are graphic, innovative and technical.')
gp_cardcover = URI.open('https://res.cloudinary.com/bjarnehinkel/image/upload/v1594832399/Greg%20Pier/Card%20Cover/gregpierplaceholder_rk2nsu.jpg')
gp.photos.attach(io: gp_cardcover, filename: 'gp_cardcover.jpg', content_type: 'image/jpg')
gp.save!
ug = Brand.new(name: 'Unique Glitter',
               slogan: 'With a modern take on the traditional artistry, we give our fur collection a twist, reinventing classic shapes into modern silhouettes.')
ug_cardcover = URI.open('https://res.cloudinary.com/bjarnehinkel/image/upload/v1594832434/Unique%20Glitter/Card%20Cover/uniqueglitterplaceholder_typcox.jpg')
ug.photos.attach(io: ug_cardcover, filename: 'ug_cardcover.jpg', content_type: 'image/jpg')
ug.save!
sl = Brand.new(name: 'Sombreros LTD.',
               slogan: "When any old hat just won't do!",
               compliment: "Sombrero LTD. hats really part you from the crowd both in design and excellent quality making them our this weeks favourite!",
               status: 'fav')
sl_cardcover = URI.open('https://res.cloudinary.com/bjarnehinkel/image/upload/v1594832352/Sombreros%20LTD/Card%20Cover/sombrerosltdplaceholder_z7lhjr.jpg')
sl.photos.attach(io: sl_cardcover, filename: 'sl_cardcover.jpg', content_type: 'image/jpg')
sl.save!
brands << gp
brands << ug
brands << sl
brands.each do |brand|
  puts "created #{brand.name}"
end

Category.destroy_all

puts "creating categories"
puts "Starting with #{gp.name}"

catsgp = ['3/4 Overcoat', 'Shawl Collection', 'Square Neck Sweater', 'Scarves', 'Caps']

catsgp.each do |cat|
  createCatAssignBrand(cat, gp)
end

puts "Done with #{gp.name}"
puts "Starting with #{ug.name}"

catsug = ['Jackets', 'Hats', 'Scarves', 'Accessories']

catsug.each do |cat|
  createCatAssignBrand(cat, ug)
end

puts "Done with #{ug.name}"
puts "creating products"
puts "Starting with #{gp.name}"

Product.destroy_all

coatgp = [['3/4 Overcoat', 1600.0]]

coatgp.each do |coat|
  createProdAssignCatBrand(coat, gp.categorys[0], gp)
end

shawlgp = [['Navy Grey Shawl Collar Cashmere Vest', 990.0],
           ['Ecru Shawl Collar Cashmere Vest', 990.0],
           ['Grey Taupe Shawl Collar Cashmere Vest', 990.0]]

shawlgp.each do |shawl|
  createProdAssignCatBrand(shawl, gp.categorys[1], gp)
end

sweatergp = [['Grey Square Neck Cashmere & Silk', 490.0],
             ['Midnight Blue Square Neck Cashmere & Silk', 490.0],
             ['Blue Grey Square Neck Cashmere & Silk', 490.0],
             ['Purple Square Neck Cashmere & Silk', 490.0]]

sweatergp.each do |sweater|
  createProdAssignCatBrand(sweater, gp.categorys[2], gp)
end

scarfgp = [['Ecru Cashmere Scarf', 250.0],
           ['Blue Grey Cashmere Scarf', 250.0],
           ['Orange Cashmere Scarf', 250.0],
           ['Purple Cashmere Scarf', 250.0],
           ['Grey Cashmere Scarf', 250.0],
           ['Midnight Blue Cashmere Scarf', 250.0],
           ['Fuschia Cashmere Scarf', 250.0]]

scarfgp.each do |scarf|
  createProdAssignCatBrand(scarf, gp.categorys[3], gp)
end

capgp = [['Orange Cashmere Cap', 120.0],
         ['Midnight Blue Cashmere Cap', 120.0],
         ['Ecru Cashmere Cap', 120.0],
         ['Grey Cashmere Cap', 120.0],
         ['Fuschia Cashmere Cap', 120.0],
         ['Blue Grey Cashmere Cap', 120.0],
         ['Purple Cashmere Cap', 120.0]]

capgp.each do |cap|
  createProdAssignCatBrand(cap, gp.categorys[4], gp)
end

puts "Done with #{gp.name}"
puts "Starting with #{ug.name}"

jacketug = [['Fur jacket brown mink/Spider man lining', 1800.0],
            ['Fur jacket brown mink/Comic lining', 1800.0],
            ['Fur bolero brown mink/Leopard lining', 1200.0],
            ['Fur bolero grey mink/Black lining', 1200.0]]

jacketug.each do |jacket|
  createProdAssignCatBrand(jacket, ug.categorys[0], ug)
end

hatsug =  [['Fur hat brown mink', 420.0],
           ['Fur head band brown mink', 420.0],
           ['Fur head band fox/White grey', 420.0],
           ['Fur hat dark mink', 420.0]]

hatsug.each do |hat|
  createProdAssignCatBrand(hat, ug.categorys[1], ug)
end

scarfsug = [['Fur scarf dark mink/Pink lining', 380.0],
            ['Fur scarf black Fox/Pirate lining', 380.0],
            ['Fur scarf red fox/Pirate lining', 380.0],
            ['Fur scarf pink fox/Pink lining', 380.0]]

scarfsug.each do |scarf|
  createProdAssignCatBrand(scarf, ug.categorys[2], ug)
end

accessug = [['Fur wrist cuff black fox/Pirate lining', 250.0],
            ['Fur collar purple', 250.0],
            ['Fur collar pink/Pink lining', 250.0],
            ['Fur wrist cuff brown mink/pair', 250.0]]

accessug.each do |accessory|
  createProdAssignCatBrand(accessory, ug.categorys[3], ug)
end

puts "Done with #{ug.name}"

puts "finished"
