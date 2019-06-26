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
