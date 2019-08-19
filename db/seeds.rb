# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Merchant.destroy_all
Item.destroy_all
#
merchant_1 = Merchant.create(name: "Stuff n' Things", address: "123 North St", city: "Denver", zip: 80203, state: "CO")
merchant_2 = Merchant.create(name: "The Widget Store", address: "456 East St", city: "Colorado Springs", zip: 80829, state: "CO")
merchant_3 = Merchant.create(name: "All the Things", address: "789 South St", city: "Boulder", zip: 80301, state: "CO" )
item_1 = merchant_1.items.create(name: "Widget", description: "Does what you need it to do", price: 10, image: 'http://images-na.ssl-images-amazon.com/images/I/71cCfpruJ6L._SX679_.jpg', active: true, inventory: 10)
