# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Merchant.destroy_all
merchant_1 = Merchant.create(name:"scott", address:"4942 willow", city:"denver", state: "co", zip:"90210")
merchant_2 = Merchant.create(name:"david", address:"4942 willow", city:"denver", state: "co", zip:"90210")
merchant_3 = Merchant.create(name:"ryan", address:"4942 willow", city:"denver", state: "co", zip:"90210")
