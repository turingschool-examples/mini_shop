# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Merchant.destroy_all

moose = Merchant.create(name: "Moose Munchies", address: "306 Meese Ave", city: "Moose Jaw", state: "MO", zip: "50400")
ehplus = Merchant.create(name: "Eh Plus School Supplies")
twofour = Merchant.create(name: "Two-Four Liquors")
