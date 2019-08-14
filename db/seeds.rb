# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Item.destroy_all
Merchant.destroy_all

@pug_stuff = Merchant.create(name: "Pug Stuff", address: "3515 Ringsby Court", city: "Denver", state: "CO", zip: 80216)
@pugtastic = Merchant.create(name: "Pugtastic", address: "3515 Puggy Court", city: "Pugville", state: "CO", zip: 80216)
@larry_land = Merchant.create(name: "Larry Land", address: "3515 Larrold Court", city: "Derptown", state: "CO", zip: 80216)
@leopard_leash = @pug_stuff.items.create(name: "Leopard Leash", description: "50-inch leash", price: 50, image: "https://images.mattel.com/scene7/GDX05_Leopard_Leash_Set_1?$oslarge$&wid=412&hei=412", active?: true, inventory: 6)
@pug_food = @pugtastic.items.create(name: "Puggo Food", description: "Dog Food", price: 20, image: "https://www.zooplus.co.uk/magazine/CACHE_IMAGES/768/content/uploads/2018/01/fotolia_108248133.jpg", active?: true, inventory: 16)
@sweet_treats = @larry_land.items.create(name: "Sweet Treats", description: "Dog Treats", price: 6, image: "https://i.pinimg.com/originals/a3/25/17/a32517db583243faca9a5b5742149297.jpg", active?: true, inventory: 3)
@sausages = @larry_land.items.create(name: "Dog Sausage", description: "Dog Sausages", price: 10.50, image: "https://i2.wp.com/deliciouspugshop.com/wp-content/uploads/2017/12/beef-sausage-treats-for-dogs.jpg?fit=425%2C425", active?: true, inventory: 13)
