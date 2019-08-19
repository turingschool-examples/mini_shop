# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Item.destory_all
Merchant.destroy_all


merchant_1 = Merchant.create(name: "Xbox 360 Games", address: "312 olive st", city: "Denver", state: "CO", zip:"80011")
merchant_2 = Merchant.create(name: "PS4 Games", address: "123 sesame st", city: "linden", state: "NJ", zip:"47238")
merchant_3 = Merchant.create(name: "Nintendo DS Games", address: "364 Oaks", city: "Columbus", state: "OH", zip:"47238")
merchant_4 = Merchant.create(name: "GameBoy", address: "999 Indo", city: "Vegas", state: "NV", zip:"47238")
merchant_5 = Merchant.create(name: "SNES Games", address: "Remmi Red 909 ", city: "Tempe", state: "AZ", zip:"47238")


item_m1 = Item.create!(name: "Megaman BN", description: "Description 1", price: 1.00, image: "https://giantbomb1.cbsistatic.com/uploads/scale_small/1/16207/1186400-oss.png", status: true, inventory: 5, merchant: merchant_4)
item_m2 = Item.create!(name: "Megaman BN2", description: "Description 2", price: 2.00, image: "https://giantbomb1.cbsistatic.com/uploads/scale_small/8/87790/1806078-box_mmbn.png", status: true, inventory: 5, merchant: merchant_4)
item_m3 = Item.create!(name: "Pokemon", description: "Description 4", price: 3.00, image: "https://img.pokemondb.net/boxes/black.jpg", status: true, inventory: 5, merchant: merchant_4)
item_m4 = Item.create!(name: "Final Fantasy", description: "Description 4", price: 3.00, image: "https://images-na.ssl-images-amazon.com/images/I/51yZcsELkCL.jpg", status: true, inventory: 5, merchant: merchant_4)
