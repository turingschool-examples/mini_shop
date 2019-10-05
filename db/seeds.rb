# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

merchant_1 = Merchant.create(name: "Chester's Collectables", address: "1900 State St", city: "Town", state: "Stateton", zip:80111)
merchant_2 = Merchant.create(name: "Gerogio's Goodies", address: "123 Fake Ave", city: "Americatown", state: "Hellostate", zip: 77856)
merchant_3 = Merchant.create(name: "Monty's Mercantile", address: "9 9th Way", city: "The Big City", state: "Alaska", zip: 11111)


merchant_1.items.create(name: "Gold Cards", price: 2500, inventory: 100, status: "Active", description: "A fancy set of solid gold cards!", image: "https://i.imgur.com/LlHMnHG.jpg")
merchant_1.items.create(name: "Antique Pocketwatch", price: 3250, inventory: 2, status: "Active", description: "An antique watch! This thing has been around for a while.", image: "https://i.imgur.com/vCiWkLH.jpg")

merchant_2.items.create(name: "Snake Oil", price: 500, inventory: 15, status: "Active", description: "Cures what ails ya!", image: "https://i.imgur.com/Bz15zXQ.jpg")
merchant_2.items.create(name: "Spurs", price: 250, inventory: 5, status: "Active", description: "Spurs that jingle jangle jingle!", image: "https://i.imgur.com/4YudCuU.jpg")
merchant_2.items.create(name: "Squeezebox", price: 20, inventory: 10, status: "Active", description: "To play when you are passin' time.", image: "https://i.imgur.com/bVpdAyP.jpg")
merchant_2.items.create(name: "Lil' Buddy", price: 500, inventory: 15, status: "Active", description: "Your new best friend.", image: "https://i.imgur.com/38vP5uv.jpg")
