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
item_1 = Item.create!(name: "Panang Curry", "Sweet and spicy", 12.50, 'http://www.aspicyperspective.com/wp-content/uploads/2017/09/The-Best-Thai-Panang-Chicken-Curry-11.jpg', "active", 12, merchant_1.id)
item_2 = Item.create!(name: "Yam Talay", "Spicy Seafood Salad", 16.50, 'https://s3.amazonaws.com/finecooking.s3.tauntonclud.com/app/uploads/2017/04/18143140/fc87mc056-01-main.jpg', "inactive", 8, merchant_1.id)

# PITA PAN
item_3 = Item.create!(name: "Stuffed Pita", "Veggies and hummus", 12.50, 'https://www.landolakes.com/RecipeManagementSystem/media/Recipe-Media-Files/Recipes/Retail/DesktopImages/12565.jpg', "inactive", 8, merchant_3.id)
item_4 = Item.create!(name: "Pita Pizza", "Sauce and cheese", 10.50, 'https://purewows3.imgix.net/images/articles/2019_04/pita-pizzas-domestic-greek-recipe-921.jpg?auto=format,compress&cs=strip', "active", 18, merchant_3.id)
item_5 = Item.create!(name: "Pita Chips", "Baked and salted", 6.00, 'https://img.buzzfeed.com/thumbnailer-prod-us-east-1/9c7590b4356c405ca11794c355ddac48/fb.jpg', "active", 0, merchant_3.id)
