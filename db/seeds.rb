# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
merchant_1 = Merchant.create!(name: "Thai Tanic", address: "410 Bleeker Street", city: "Philadelphia", state: "PA", zip: "19107" )
merchant_2 = Merchant.create!(name: "Lord of the Rinse", address: "384 Spring Ave", city: "New York", state: "NY", zip: "11221" )
merchant_3 = Merchant.create!(name: "Pita Pan", address: "930 Sunrise Blvd", city: "San Diego", state: "CA", zip: "92103" )

# THAI TANIC
item_1 = Item.create!(name: "Panang Curry", description: "Sweet and spicy Thai curry dish", price: 12.50, image_url: 'https://cdn.shopify.com/s/files/1/0076/4339/8233/files/thai-panang-curry-recipe-744x547-min.png?v=1542712351', status: true, inventory: 12, merchant_id: merchant_1.id)
item_2 = Item.create!(name: "Yam Talay", description: "Spicy Seafood Salad", price: 16.50, image_url: 'https://s3.amazonaws.com/finecooking.s3.tauntonclud.com/app/uploads/2017/04/18143140/fc87mc056-01-main.jpg', status: false, inventory: 8, merchant_id: merchant_1.id)

# PITA PAN
item_3 = Item.create!(name: "Stuffed Pita",description: "Veggies and hummus in pita", price: 12.50, image_url: 'https://happykitchen.rocks/wp-content/uploads/2017/08/Vegan-Pita-Pockets-with-Roasted-Veggies-and-Hummus-in-a-Tray-Macro.jpg', status: false, inventory: 8, merchant_id: merchant_3.id)
item_4 = Item.create!(name: "Pita Pizza", description: "Sauce and cheese in pita baked in oven", price: 10.50, image_url: 'https://purewows3.imgix.net/images/articles/2019_04/pita-pizzas-domestic-greek-recipe-921.jpg?auto=format,compress&cs=strip', status: true, inventory: 18, merchant_id: merchant_3.id)
item_5 = Item.create!(name: "Pita Chips", description: "Baked and salted pita slices", price: 6.00, image_url: 'https://img.buzzfeed.com/thumbnailer-prod-us-east-1/9c7590b4356c405ca11794c355ddac48/fb.jpg', status: true, inventory: 0, merchant_id: merchant_3.id)
