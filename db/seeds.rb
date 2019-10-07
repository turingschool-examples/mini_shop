# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

merchant_1 = Merchant.create(name: "Ready, Set, Hike!",
                             address: "425 Lincoln Street",
                             city: "Denver",
                             state: "CO",
                             zip: 80128)

merchant_2 = Merchant.create(name: "Crosscheck",
                             address: "818 Minnesota Avenue",
                             city: "Orlando",
                             state: "FL",
                             zip: 32810)

merchant_3 = Merchant.create(name: "Tip Off",
                             address: "739 Hoosier Boulevard",
                             city: "New Orleans",
                             state: "LA",
                             zip: 70010)

merchant_1.items.create(name: "Football",
                        description: "Genuine leather football. League official size and weight. Perfect for easy-going or professional games.",
                        price: 35.99,
                        image: "https://i.imgur.com/Q7UnMeW.jpg",
                        status: "active",
                        inventory: 5)

merchant_1.items.create(name: "Helmet",
                        description: "Polymer based football helmet with comfortable foam pads inside. Be competitve and play safely with this stress-tested helmet.",
                        price: 64.75,
                        image: "https://i.imgur.com/ctAyPyB.jpg",
                        status: "active",
                        inventory: 7)

merchant_2.items.create(name: "Hockey Stick",
                        description: "Made from solid cherry wood and sporting a perfect grip, this hockey stick meets all official regulation requirements and will put you over the competition.",
                        price: 89.23,
                        image: "https://i.imgur.com/IaXLwhF.jpg",
                        status: "active",
                        inventory: 3)

merchant_2.items.create(name: "Hockey Puck",
                        description: "Every hockey puck is made of rubber, but not every puck uses the same rubber as Formula 1 tires. For those that are serious about the game.",
                        price: 14.99,
                        image: "https://i.imgur.com/7Vkjbaj.jpg",
                        status: "active",
                        inventory: 9)

merchant_3.items.create(name: "Basketball",
                        description: "Official regulation basketball with molecular optimized grip.",
                        price: 33.67,
                        image: "https://i.imgur.com/oozv6Nc.jpg",
                        status: "active",
                        inventory: 2)

merchant_3.items.create(name: "Basketball Shoes",
                        description: "Our shoes may not make you a better player, but when you're the best, you don't need to play better. You need to make a statement. Made with genuine leather.",
                        price: 145.99,
                        image: "https://i.imgur.com/Iob3M7M.jpg",
                        status: "active",
                        inventory: 11)
