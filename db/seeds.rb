# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# merchants

book_shop = Merchant.create(name: "Flourish and Blotts", address: "123 Diagon Alley", city: "London", state: "UK", zip: 25126)
wand_shop = Merchant.create(name: "Ollivanders", address: "125 Diagon Alley", city: "London", state: "UK", zip: 25126)

# book_shop_items
book_1 = book_shop.items.create(name: "Advanced Potion-Making", description: "Bewitch the mind and ensare the senses.", price: 40, image: "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1510621089i/36591237._UY774_SS774_.jpg", inventory: 15)
book_2 = book_shop.items.create(name: "Fantastic Beasts and Where to Find Them", description: "Billywigs, bowtruckles, and nifflers, oh my!", price: 35, image: "http://cdn.shopify.com/s/files/1/0064/5342/8271/products/HPFB1-fantastic-beasts-front-1200.jpg?v=1550953382", inventory: 20)

# wand_shop_items
wand = wand_shop.items.create(name: "Vine Wood Wand", description: "Vine wood with a dragon heartstring core.", price: 100, image: "https://images-na.ssl-images-amazon.com/images/I/816nAgnLhXL._AC_SL1500_.jpg", active?:false, inventory: 2)
