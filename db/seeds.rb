# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


merch_1 = Merchant.create(name: "Billy", address: "123 Ya moms house Circle", city: "Chicago",
  state: "Illinois", zip: 78047)
merch_2 = Merchant.create(name: "Mr. Guy", address: "1 big ole' Drive", city: "Honolulu",
  state: "Hawaii", zip: 11111)
merch_3 = Merchant.create(name: "Penny Pinchin' Paul", address: "345 10th St", city: "Denver",
  state: "Colorado", zip: 80204)
merch_4 = Merchant.create(name: "Money Mike", address: "$$ Money Drive", city: "Cashville",
  state: "New York", zip: 90876)


item_1 = merch_1.items.create(name: "The Worlds Best Tooth Brush", description: "It's just a normal toothbrush.",
  price: 1.99, image_url: "first lengthy link", status: 0, inventory: 6)
item_2 = merch_2.items.create(name: "The worlds worst ear Brush", description: "A brush for your ear made of gold.",
  price: 199.99, image_url: "second lengthy link", status: 1, inventory: 1)
item_3 = merch_3.items.create(name: "A real fake mustache!", description: "An actual fake mustache.",
  price: 0.99 ,  image_url: "third lengthy link", status: 0, inventory: 689)
item_4 = merch_4.items.create(name: "Air holding Box", description: "Our lightest box yet.",
  price: 3.99, image_url: "last lengthy link", status: 0, inventory: 0)
