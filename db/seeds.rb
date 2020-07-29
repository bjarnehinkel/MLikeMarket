# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

brands = []
puts "deleting brands"
Brand.destroy_all
puts "done"

puts "Creating Brands"
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

puts "finished"
