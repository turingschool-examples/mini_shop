# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

pizza_shop = Merchant.create({name: "Paul's Pizza", address: "1234 Broadway St", city: "Denver", state: "Colorado", zip: "80203" })
pizza_shop.items.create!({name: "Pepperoni Pizza", description: "Fresh pepperoni with all the cheese", price: 19.99, image: "https://cdn-image.myrecipes.com/sites/default/files/styles/medium_2x/public/image/recipes/ck/gluten-free-cookbook/pepperoni-pizza-ck-x.jpg?itok=NWreajsZ", status: "active", inventory: 10, merchant_name: "Paul's Pizza"})

taco_shop = Merchant.create({name: "Tyler's Tacos", address: "6848 Lincoln St", city: "Denver", state: "Colorado", zip: "80209" })
taco_shop.items.create!({name: "Barbacoa", description: "Slow roasted shredded beef, salsa salpicon, sour cream", price: 7.99, image: "https://www.the-girl-who-ate-everything.com/wp-content/uploads/2015/04/TheGirlWhoAteEverything_BarbacoaTacos_Hero_Vertical.jpg", status: "active", inventory: 20, merchant_name: "Tyler's Tacos"})
