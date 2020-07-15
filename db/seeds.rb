# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "deleting brands"
Brand.destroy_all
puts "done"

puts "Creating Brands"
brands = Brand.create([{ name: 'Greg Pier', slogan: 'The creation of new clothing lines, singular and refined, inspired by architecture and contemporary art. Greg Pier collections are graphic, innovative and technical.' }, { name: 'Unique Glitter', slogan: 'With a modern take on the traditional artistry, we give our fur collection a twist, reinventing classic shapes into modern silhouettes.' }, { name: 'Sombreros LTD.', slogan: "When any old hat just won't do" }])
brands.each do |brand|
  puts "created #{brand.name}"
end

puts "finished"
