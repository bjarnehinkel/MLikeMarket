# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'resolv-replace'

def formatName(name)
  words = name.split(" ")
  words.join('_')
end

def createCatAssignBrand(cat, brand)
  newCat = Category.new(name: cat)
  newCat.brand = brand
  newCat.save!
end

def createProdAssignCatBrand(prod, cat, brand)
  newProd = Product.new(name: prod[:name], price: prod[:price])
  newProd.brand = brand
  newProd.category = cat
  prod[:links].each_with_index do |picUrl, index|
    pic = URI.open(picUrl)
    _name = formatName(newProd.name)
    newProd.photos.attach(io: pic, filename: "#{_name}_#{index + 1}.png", content_type: 'image/png')
  end
  newProd.save!
end

brands = []
puts "deleting brands"
Brand.all.each do |brand|
  brand.photos.each do |photo|
    photo.purge
  end
end
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

Product.all.each do |product|
  if product.photos.attached?
    product.photos.each do |photo|
      photo.purge
    end
  end
end
Product.destroy_all

coatgp = [{ name: '3/4 Overcoat',
            price: 1600.0,
            images: [ 'https://res.cloudinary.com/bjarnehinkel/image/upload/v1596206098/Greg%20Pier/Categories/Coats/Overcoat/overcoat_1_ztud63.jpg',
                      'https://res.cloudinary.com/bjarnehinkel/image/upload/v1596206104/Greg%20Pier/Categories/Coats/Overcoat/overcoat_2_se7owr.jpg',
                      'https://res.cloudinary.com/bjarnehinkel/image/upload/v1596206113/Greg%20Pier/Categories/Coats/Overcoat/overcoat_3_mxblm9.png',
                      'https://res.cloudinary.com/bjarnehinkel/image/upload/v1596206085/Greg%20Pier/Categories/Coats/Overcoat/overcoat_4_scuoqz.png',
                      'https://res.cloudinary.com/bjarnehinkel/image/upload/v1596206166/Greg%20Pier/Categories/Coats/Overcoat/overcoat_5_vxtyha.png',
                    ],
            description: 'This three quarter overcoat will protect you from the cold weather, wind and rain and will bring you unequalled design and singular elegance.'
          }]



coatgp.each do |coat|
  createProdAssignCatBrand(coat, gp.categorys[0], gp)
end

{name: }

shawlgp = [['Navy Grey Shawl Collar Cashmere Vest', 990.0, ['https://res.cloudinary.com/bjarnehinkel/image/upload/v1596206312/Greg%20Pier/Categories/Shawl%20Collection/Navy%20Grey%20Shawl%20Collar%20Cashmere%20Vest/navyShawl1_hi7buu.jpg',
                                                            'https://res.cloudinary.com/bjarnehinkel/image/upload/v1596206315/Greg%20Pier/Categories/Shawl%20Collection/Navy%20Grey%20Shawl%20Collar%20Cashmere%20Vest/navyShawl2_jdvwba.jpg',
                                                            'https://res.cloudinary.com/bjarnehinkel/image/upload/v1596206318/Greg%20Pier/Categories/Shawl%20Collection/Navy%20Grey%20Shawl%20Collar%20Cashmere%20Vest/navyShawl3_e7l1fs.jpg']],
           ['Ecru Shawl Collar Cashmere Vest', 990.0, ['https://res.cloudinary.com/bjarnehinkel/image/upload/v1596206391/Greg%20Pier/Categories/Shawl%20Collection/Ecru%20Shawl%20Collar%20Cashmere%20Vest/ecruShawl1_yoerow.jpg',
                                                       'https://res.cloudinary.com/bjarnehinkel/image/upload/v1596206394/Greg%20Pier/Categories/Shawl%20Collection/Ecru%20Shawl%20Collar%20Cashmere%20Vest/ecruShawl2_nyyrua.jpg',
                                                       'https://res.cloudinary.com/bjarnehinkel/image/upload/v1596206397/Greg%20Pier/Categories/Shawl%20Collection/Ecru%20Shawl%20Collar%20Cashmere%20Vest/ecruShawl3_dn6vc9.jpg']],
           ['Grey Taupe Shawl Collar Cashmere Vest', 990.0, ['https://res.cloudinary.com/bjarnehinkel/image/upload/v1596206486/Greg%20Pier/Categories/Shawl%20Collection/Grey%20Taupe%20Shawl%20Collar%20Cashmere%20Vest/greyShawl1_ourtdy.jpg',
                                                             'https://res.cloudinary.com/bjarnehinkel/image/upload/v1596206489/Greg%20Pier/Categories/Shawl%20Collection/Grey%20Taupe%20Shawl%20Collar%20Cashmere%20Vest/greyShawl2_x6mhpm.jpg',
                                                             'https://res.cloudinary.com/bjarnehinkel/image/upload/v1596206493/Greg%20Pier/Categories/Shawl%20Collection/Grey%20Taupe%20Shawl%20Collar%20Cashmere%20Vest/greyShawl3_dfqdov.png']]]

shawlgp.each do |shawl|
  createProdAssignCatBrand(shawl, gp.categorys[1], gp)
end

sweatergp = [['Grey Square Neck Cashmere & Silk', 490.0, ['https://res.cloudinary.com/bjarnehinkel/image/upload/v1596206802/Greg%20Pier/Categories/Square%20Neck%20Sweaters/Grey%20Square%20Neck%20Cashmere%20Silk/greySweater1_nsolwi.jpg',
                                                          'https://res.cloudinary.com/bjarnehinkel/image/upload/v1596206808/Greg%20Pier/Categories/Square%20Neck%20Sweaters/Grey%20Square%20Neck%20Cashmere%20Silk/greySweater2_kduqse.jpg',
                                                          'https://res.cloudinary.com/bjarnehinkel/image/upload/v1596206811/Greg%20Pier/Categories/Square%20Neck%20Sweaters/Grey%20Square%20Neck%20Cashmere%20Silk/greySweater3_mzxpvk.jpg',
                                                          'https://res.cloudinary.com/bjarnehinkel/image/upload/v1596206815/Greg%20Pier/Categories/Square%20Neck%20Sweaters/Grey%20Square%20Neck%20Cashmere%20Silk/greySweater4_xj8j34.jpg']],
             ['Midnight Blue Square Neck Cashmere & Silk', 490.0, ['https://res.cloudinary.com/bjarnehinkel/image/upload/v1596206916/Greg%20Pier/Categories/Square%20Neck%20Sweaters/Midnight%20Blue%20Square%20Neck%20Cashmere%20Silk/blueSweater1_mg9dwf.jpg',
                                                                   'https://res.cloudinary.com/bjarnehinkel/image/upload/v1596206941/Greg%20Pier/Categories/Square%20Neck%20Sweaters/Midnight%20Blue%20Square%20Neck%20Cashmere%20Silk/blueSweater2_ytqsk2.jpg',
                                                                   'https://res.cloudinary.com/bjarnehinkel/image/upload/v1596206965/Greg%20Pier/Categories/Square%20Neck%20Sweaters/Midnight%20Blue%20Square%20Neck%20Cashmere%20Silk/blueSweater3_m0gvkx.jpg',
                                                                   'https://res.cloudinary.com/bjarnehinkel/image/upload/v1596206979/Greg%20Pier/Categories/Square%20Neck%20Sweaters/Midnight%20Blue%20Square%20Neck%20Cashmere%20Silk/blueSweater4_cl0mmu.jpg']],
             ['Blue Grey Square Neck Cashmere & Silk', 490.0, ['https://res.cloudinary.com/bjarnehinkel/image/upload/v1596207073/Greg%20Pier/Categories/Square%20Neck%20Sweaters/Blue%20Grey%20Square%20Neck%20Cashmere%20Silk/lBlueSweater1_vr6nmn.jpg',
                                                               'https://res.cloudinary.com/bjarnehinkel/image/upload/v1596207078/Greg%20Pier/Categories/Square%20Neck%20Sweaters/Blue%20Grey%20Square%20Neck%20Cashmere%20Silk/lBlueSweater2_ehuzpp.jpg',
                                                               'https://res.cloudinary.com/bjarnehinkel/image/upload/v1596207083/Greg%20Pier/Categories/Square%20Neck%20Sweaters/Blue%20Grey%20Square%20Neck%20Cashmere%20Silk/lBlueSweater3_moo8uk.jpg',
                                                               'https://res.cloudinary.com/bjarnehinkel/image/upload/v1596207087/Greg%20Pier/Categories/Square%20Neck%20Sweaters/Blue%20Grey%20Square%20Neck%20Cashmere%20Silk/lBlueSweater4_ybnkbh.jpg']],
             ['Purple Square Neck Cashmere & Silk', 490.0, ['https://res.cloudinary.com/bjarnehinkel/image/upload/v1596207154/Greg%20Pier/Categories/Square%20Neck%20Sweaters/Purple%20Square%20Neck%20Cashmere%20Silk/purpleSweater1_v51d5d.jpg',
                                                            'https://res.cloudinary.com/bjarnehinkel/image/upload/v1596207158/Greg%20Pier/Categories/Square%20Neck%20Sweaters/Purple%20Square%20Neck%20Cashmere%20Silk/purpleSweater2_cp11ux.jpg',
                                                            'https://res.cloudinary.com/bjarnehinkel/image/upload/v1596207162/Greg%20Pier/Categories/Square%20Neck%20Sweaters/Purple%20Square%20Neck%20Cashmere%20Silk/purpleSweater3_idmgkm.jpg',
                                                            'https://res.cloudinary.com/bjarnehinkel/image/upload/v1596207167/Greg%20Pier/Categories/Square%20Neck%20Sweaters/Purple%20Square%20Neck%20Cashmere%20Silk/purpleSweater4_mrbba1.jpg']]]

sweatergp.each do |sweater|
  createProdAssignCatBrand(sweater, gp.categorys[2], gp)
end

scarfgp = [['Ecru Cashmere Scarf', 250.0, ['https://res.cloudinary.com/bjarnehinkel/image/upload/v1596207419/Greg%20Pier/Categories/Scarves/Ecru%20Cashmere%20Scarf/ecruScarf2_ivsslu.png',
                                           'https://res.cloudinary.com/bjarnehinkel/image/upload/v1596207424/Greg%20Pier/Categories/Scarves/Ecru%20Cashmere%20Scarf/ecruScarf1_aks6vp.jpg']],
           ['Blue Grey Cashmere Scarf', 250.0, ['https://res.cloudinary.com/bjarnehinkel/image/upload/v1596207470/Greg%20Pier/Categories/Scarves/Blue%20Grey%20Cashmere%20Scar/blueScarf2_xmuzdp.jpg',
                                                'https://res.cloudinary.com/bjarnehinkel/image/upload/v1596207467/Greg%20Pier/Categories/Scarves/Blue%20Grey%20Cashmere%20Scar/blueScarf1_vyyddc.jpg']],
           ['Orange Cashmere Scarf', 250.0, ['https://res.cloudinary.com/bjarnehinkel/image/upload/v1596207512/Greg%20Pier/Categories/Scarves/Orange%20Cashmere%20Scarf/orangeScarf2_lwbajm.png',
                                             'https://res.cloudinary.com/bjarnehinkel/image/upload/v1596207509/Greg%20Pier/Categories/Scarves/Orange%20Cashmere%20Scarf/orangeScarf_dob0v5.jpg']],
           ['Purple Cashmere Scarf', 250.0, ['https://res.cloudinary.com/bjarnehinkel/image/upload/v1596207552/Greg%20Pier/Categories/Scarves/Purple%20Cashmere%20Scarf/purpleScarf2_rawt12.png',
                                             'https://res.cloudinary.com/bjarnehinkel/image/upload/v1596207549/Greg%20Pier/Categories/Scarves/Purple%20Cashmere%20Scarf/purpleScarf1_equsfn.jpg']],
           ['Grey Cashmere Scarf', 250.0, ['https://res.cloudinary.com/bjarnehinkel/image/upload/v1596207608/Greg%20Pier/Categories/Scarves/Grey%20Cashmere%20Scarf/greyScarf2_poej3d.jpg',
                                           'https://res.cloudinary.com/bjarnehinkel/image/upload/v1596207607/Greg%20Pier/Categories/Scarves/Grey%20Cashmere%20Scarf/greyScarf1_qeu7bk.jpg']],
           ['Midnight Blue Cashmere Scarf', 250.0, ['https://res.cloudinary.com/bjarnehinkel/image/upload/v1596207654/Greg%20Pier/Categories/Scarves/Midnight%20Blue%20Cashmere%20Scarf/mBlueScarf2_miy2qm.png',
                                                    'https://res.cloudinary.com/bjarnehinkel/image/upload/v1596207651/Greg%20Pier/Categories/Scarves/Midnight%20Blue%20Cashmere%20Scarf/mBlueScarf1_hbky7q.jpg']],
           ['Fuschia Cashmere Scarf', 250.0, ['https://res.cloudinary.com/bjarnehinkel/image/upload/v1596207707/Greg%20Pier/Categories/Scarves/Fuschia%20Cashmere%20Scarf/fuschiaScarf2_xsphnn.png',
                                              'https://res.cloudinary.com/bjarnehinkel/image/upload/v1596207704/Greg%20Pier/Categories/Scarves/Fuschia%20Cashmere%20Scarf/fuschiaScarf1_aamjui.jpg']]]

scarfgp.each do |scarf|
  createProdAssignCatBrand(scarf, gp.categorys[3], gp)
end

capgp = [['Orange Cashmere Cap', 120.0, ['https://res.cloudinary.com/bjarnehinkel/image/upload/v1596207828/Greg%20Pier/Categories/Caps/Orange%20Cashmere%20Cap/orangeCap1_wbbnpj.png',
                                         'https://res.cloudinary.com/bjarnehinkel/image/upload/v1596207831/Greg%20Pier/Categories/Caps/Orange%20Cashmere%20Cap/orangeCap2_ukmtat.jpg']],
         ['Midnight Blue Cashmere Cap', 120.0, ['https://res.cloudinary.com/bjarnehinkel/image/upload/v1596207879/Greg%20Pier/Categories/Caps/Midnight%20Blue%20Cashmere%20Cap/mBlueCap1_ftghhe.png',
                                                'https://res.cloudinary.com/bjarnehinkel/image/upload/v1596207880/Greg%20Pier/Categories/Caps/Midnight%20Blue%20Cashmere%20Cap/mBlueCap2_xkjdre.jpg']],
         ['Ecru Cashmere Cap', 120.0, ['https://res.cloudinary.com/bjarnehinkel/image/upload/v1596207917/Greg%20Pier/Categories/Caps/Ecru%20Cashmere%20Cap/ecruCap1_ozvtft.png',
                                       'https://res.cloudinary.com/bjarnehinkel/image/upload/v1596207918/Greg%20Pier/Categories/Caps/Ecru%20Cashmere%20Cap/ecruCap2_v0hiax.jpg']],
         ['Grey Cashmere Cap', 120.0, ['https://res.cloudinary.com/bjarnehinkel/image/upload/v1596207948/Greg%20Pier/Categories/Caps/Grey%20Cashmere%20Cap/greyCap1_edkt86.png',
                                       'https://res.cloudinary.com/bjarnehinkel/image/upload/v1596207950/Greg%20Pier/Categories/Caps/Grey%20Cashmere%20Cap/greyCap2_fod5zp.jpg']],
         ['Fuschia Cashmere Cap', 120.0, ['https://res.cloudinary.com/bjarnehinkel/image/upload/v1596207991/Greg%20Pier/Categories/Caps/Fuschia%20Cashmere%20Cap/fuschiaCap1_vwvj3l.jpg',
                                          'https://res.cloudinary.com/bjarnehinkel/image/upload/v1596207994/Greg%20Pier/Categories/Caps/Fuschia%20Cashmere%20Cap/fuschiaCap2_asbscs.jpg']],
         ['Blue Grey Cashmere Cap', 120.0, ['https://res.cloudinary.com/bjarnehinkel/image/upload/v1596208060/Greg%20Pier/Categories/Caps/Blue%20Grey%20Cashmere%20Cap/lBlueCap1_rvhcrd.png',
                                            'https://res.cloudinary.com/bjarnehinkel/image/upload/v1596208067/Greg%20Pier/Categories/Caps/Blue%20Grey%20Cashmere%20Cap/lBlueCap2_jeapnl.jpg']],
         ['Purple Cashmere Cap', 120.0, ['https://res.cloudinary.com/bjarnehinkel/image/upload/v1596208096/Greg%20Pier/Categories/Caps/Purple%20Cashmere%20Cap/purpleCap1_vlp52n.png',
                                         'https://res.cloudinary.com/bjarnehinkel/image/upload/v1596208101/Greg%20Pier/Categories/Caps/Purple%20Cashmere%20Cap/purpleCap_wlohs2.jpg']]]

capgp.each do |cap|
  createProdAssignCatBrand(cap, gp.categorys[4], gp)
end

puts "Done with #{gp.name}"
puts "Starting with #{ug.name}"

jacketug = [['Fur jacket brown mink/Spider man lining', 1800.0, []],
            ['Fur jacket brown mink/Comic lining', 1800.0, []],
            ['Fur bolero brown mink/Leopard lining', 1200.0, []],
            ['Fur bolero grey mink/Black lining', 1200.0, []]]

jacketug.each do |jacket|
  createProdAssignCatBrand(jacket, ug.categorys[0], ug)
end

hatsug =  [['Fur hat brown mink', 420.0, []],
           ['Fur head band brown mink', 420.0, []],
           ['Fur head band fox/White grey', 420.0, []],
           ['Fur hat dark mink', 420.0, []]]

hatsug.each do |hat|
  createProdAssignCatBrand(hat, ug.categorys[1], ug)
end

scarfsug = [['Fur scarf dark mink/Pink lining', 380.0, []],
            ['Fur scarf black Fox/Pirate lining', 380.0, []],
            ['Fur scarf red fox/Pirate lining', 380.0, []],
            ['Fur scarf pink fox/Pink lining', 380.0, []]]

scarfsug.each do |scarf|
  createProdAssignCatBrand(scarf, ug.categorys[2], ug)
end

accessug = [['Fur wrist cuff black fox/Pirate lining', 250.0, []],
            ['Fur collar purple', 250.0, []],
            ['Fur collar pink/Pink lining', 250.0, []],
            ['Fur wrist cuff brown mink/pair', 250.0, []]]

accessug.each do |accessory|
  createProdAssignCatBrand(accessory, ug.categorys[3], ug)
end

puts "Done with #{ug.name}"

puts "finished"
