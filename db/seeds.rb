# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Merchant.destroy_all

merchant_1 = Merchant.create(name: "Scott", address: "312 olive st", city: "Denver", state: "CO", zip:"80011")
merchant_2 = Merchant.create(name: "bob", address: "123 sesame st", city: "linden", state: "NJ", zip:"47238")
