
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Merchant.destroy_all
Item.destroy_all

@merchant_1 = Merchant.create(name: "merchant_1", address: "123 Main", city: "Denver", state:"CO", zip:"80204")
@merchant_2 = Merchant.create(name: "merchant_2", address: "789 Pacific", city: "Lakewood", state:"CO", zip:"80214")

@item_1 = @merchant_1.items.create(name: "flylow chemical", description: "Mens ski pant", price: 325, image: "how do i do this" , active: true, inventory: 12)
@item_2 = @merchant_2.items.create(name: "ON3P Jeffrey", description: "Big mountain ski", price: 699, image: "how do i do this" , active: true, inventory: 9,)
