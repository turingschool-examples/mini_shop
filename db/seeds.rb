# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
    merchant_1 = Merchant.create!(name: "Henry", address: "410 Bleeker Street", city: "Philadelphia", state: "PA", zip: "19107" )
    merchant_2 = Merchant.create!(name: "Olivia", address: "384 Spring Ave", city: "New York", state: "NY", zip: "11221" )
    merchant_3 = Merchant.create!(name: "Ava", address: "930 Sunrise Blvd", city: "San Diego", state: "CA", zip: "92103" )
