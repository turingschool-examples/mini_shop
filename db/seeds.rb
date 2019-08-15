# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Merchant.create(name: "Stuff n' Things", address: "123 North St", city: "Denver", zip: 80203, state: CO)
Merchant.create(name: "The Widget Store", address: "456 East St", city: "Colorado Springs", zip: 80829, state: CO)
Merchant.create(name: "All the Things", address: "789 South St", city: "Boulder", zip: 80301, state: CO )
