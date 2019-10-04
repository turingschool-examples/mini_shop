# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

merchant_1 = Merchant.create(name: "Puppers R Us",
                             address: "425 Dog Day Street",
                             city: "Denver",
                             state: "CO",
                             zip: 80210)

merchant_2 = Merchant.create(name: "Kitten Market",
                             address: "818 Catastic Avenue",
                             city: "Orlando",
                             state: "FL",
                             zip: 32810)

merchant_3 = Merchant.create(name: "Owl City",
                             address: "739 Hoot Boulevard",
                             city: "New Orleans",
                             state: "LA",
                             zip: 70010)

merchant_1.items.create(name: "Dog Bowl",
                        description: "5\" stainless steel dog bowl",
                        price: 35.99,
                        image: "https://i.imgur.com/3H1e3k7.jpg",
                        status: "active",
                        inventory: 5)

merchant_1.items.create(name: "Dog Bed",
                        description: "Luxury memory foam dog bed for your pupper (dog not included!)",
                        price: 80,
                        image: "https://i.imgur.com/D8a4HLN.jpg",
                        status: "active",
                        inventory: 7)

merchant_2.items.create(name: "Cat Carrier",
                        description: "Spacious carrier for your feline friend. It will feel like a hotel for your cat! Three zippable flaps.",
                        price: 27.42,
                        image: "https://i.imgur.com/1tX0wB0.jpg",
                        status: "active",
                        inventory: 3)

merchant_2.items.create(name: "Cat Post",
                        description: "Scratching and resting post combo, two for one! 27\" tall.",
                        price: 25,
                        image: "https://i.imgur.com/vim9kYM.jpg",
                        status: "active",
                        inventory: 9)

merchant_3.items.create(name: "Leather Falconry Gloves",
                        description: "Pristine leather falconry gloves, one size fits all. Superior quality and build. Lifetime warranty.",
                        price: 149.99,
                        image: "https://i.imgur.com/hz844Rg.jpg",
                        status: "active",
                        inventory: 2)

merchant_3.items.create(name: "Toy Mouse",
                        description: "Plush 3\" mouse for your owl to play with. Instant fun!",
                        price: 17.99,
                        image: "https://i.imgur.com/I5rCHxZ.jpg",
                        status: "active",
                        inventory: 11)
