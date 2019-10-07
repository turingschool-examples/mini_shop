# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
rei = Merchant.create(name: "REI", address: "1789 28th St", city: "Boulder", state: "Colorado", zip: "80301")
moosejaw = Merchant.create(name: "Moosejaw", address: "1755 29th St #1092", city: "Boulder", state: "Colorado", zip: "80301")
patagonia = Merchant.create(name: "Patagonia", address: "1431 15th St", city: "Denver", state: "Colorado", zip: "80202")


rei.items.create(
  name: "Beanie",
  description: "It's a hat",
  price: 50,
  image: 'https://images.app.goo.gl/iDdDGM1vEZpUBY4M6',
  active: true,
  inventory: 50,
)

rei.items.create(
  name: "Boots",
  description: "They're boots",
  price: 42,
  image: 'https://images.app.goo.gl/fscn8iVUD56gpZraA',
  active: true,
  inventory: 400,
)