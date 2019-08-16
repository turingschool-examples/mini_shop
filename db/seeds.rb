# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Merchant.destroy_all

moose = Merchant.create(name: "Moose Munchies", address: "306 Meese Ave", city: "Moose Jaw", state: "MO", zip: "50400")
ehplus = Merchant.create(name: "Eh Plus School Supplies", address: "123 ABC St", city: "Elbow", state: "ND", zip: "50410")
twofour = Merchant.create(name: "Two-Four Liquors", address: "416 Mickey Rd", city: "Punkeydoodles Corners", state: "NY", zip: "48186")
poutine = Merchant.create(name: "Poutine Parlour", address: "514 Tabarnak Dr", city: "Montreal", state: "MI", zip: "47262")
