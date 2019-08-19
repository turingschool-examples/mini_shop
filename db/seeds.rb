
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Merchant.destroy_all
Item.destroy_all

@rare_seed = Merchant.create(name: "Baker Creek Heirloom", address: "123 Main", city: "Denver", state:"CO", zip:"80204")
@thai_food = Merchant.create(name: "Aloy", address: "789 Pacific", city: "Lakewood", state:"CO", zip:"80214")

@item_1 = @rare_seed.items.create(name: "Blue Beauty", description: "Heirloom tomato with blue shoulders", price: 4, image: "https://www.rareseeds.com/assets/1/14/DimRegular/tomato-blue-beauty.jpg" , active: true, inventory: 0)
@item_2 = @rare_seed.items.create(name: "Kellog Breakfast", description: "Large orange heirloom tomato", price: 6, image: "https://www.rareseeds.com/assets/1/14/DimRegular/Tomato-Kellogs-Breakfast-TO101-1-1057-373-DSC03804.jpg" , active: true, inventory: 9)
@item_3 = @thai_food.items.create(name: "Stick Rice", description: "thai glutinous rice", price: 2, image: "https://thewoksoflife.com/wp-content/uploads/2019/04/how-to-make-sticky-rice-7.jpg" , active: true, inventory: 122,)
@item_4 = @thai_food.items.create(name: "Birdseye chili", description: "Hot thai chili", price: 3, image: "https://www.chilipeppermadness.com/wp-content/uploads/2019/04/Thai-Peppers.jpg" , active: true, inventory: 40,)
