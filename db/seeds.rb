# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
 Item.destroy_all
 Merchant.destroy_all

 merchant_1 = Merchant.create(name: "Banana Bazaar", address: "123 Fruit Lane", city: "Niceville", state: "Florida", zip: 32578)
 merchant_2 = Merchant.create(name: "Cherry Corner", address: "456 Basket Cir", city: "Limon", state: "Colorado", zip: 80828)
 merchant_3 = Merchant.create(name: "Passion Place", address: "789 Sweet Ave", city: "Seattle", state: "WA", zip: 87667)
 item_1 = merchant_1.items.create(name: "Pineapple", description: "very large and very ripe", price: 3.23, image: "https://images-na.ssl-images-amazon.com/images/I/81qIPbnzqCL._SY679_.jpg", status: "active", inventory: 1)
 item_2 = merchant_1.items.create(name: "Dragon Fruit", description: "odd looking and very sweet", price: 1.91, image: "https://cdn.shortpixel.ai/client/q_glossy,ret_img,w_800/https://www.vegaproduce.com/wp-content/uploads/2018/10/Dragon-Fruit-Golden-1.png", status: "active", inventory: 3)
 item_3 = merchant_2.items.create(name: "Kiwi", description: "juicy and fuzzy peel", price: 0.90, image: "https://cdn-prod.medicalnewstoday.com/content/images/articles/317/317776/kiwi-fruit.jpg", status: "inactive", inventory: 0)
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
