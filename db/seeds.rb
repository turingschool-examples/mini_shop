# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

merchant = Merchant.create(name: "Name of Merchant", address: "1900 state st", city: "Town", state: "States", zip:80111)

15.times do
  merchant.items.create(name: "Item", price: 100, inventory:100, status:"Active", description:"Stuff", image:"url")
end