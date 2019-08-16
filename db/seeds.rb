# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Item.destroy_all
Merchant.destroy_all

item_1 = Item.create(
  name: "Blueberries",
  description: "Kirkland Signature Whole Dried Blueberries",
  price: 10.99,
  image: "https://d1fywv0iz2cv2w.cloudfront.net/product-image/v201610/cff2fff29dfb318dd3c5fdc2eea96810.jpeg",
  status: TRUE,
  inventory: 1000
)

  item_2 = Item.create(
    name: "Rainier Cherries",
    description: "Rainier Cherries, 2 lbs",
    price: 15.99,
    image: "https://images.costcobusinessdelivery.com/ImageDelivery/imageService?profileId=12028466&itemId=53747&recipeName=680",
    status: TRUE,
    inventory: 200
  )

  item_3 = Item.create(
    name: "Nectarines",
    description: "White Flesh Premium Nectarines, 5 lbs",
    price: 9.99,
    image: "https://d1fywv0iz2cv2w.cloudfront.net/pimage/2925a20c743423a12f1be4f348f0013f.jpeg",
    status: FALSE,
    inventory: 500
  )

merchant_1 = Merchant.create(name: "Cecilia Chapman", address: "711-2880 Nulla St.", city: "Mankato", state: "MS", zip: 96522)
merchant_2 = Merchant.create(name: "Iris Watson", address: "8562 Fusce Rd.", city: "Frederick", state: "NB", zip: 20620)
merchant_3 = Merchant.create(name: "Calista Wise", address: "7292 Dictum Ave", city: "San Antonio", state: "MI", zip: 47096)
merchant_4 = Merchant.create(name: "Forrest Ray", address: "191-103 Integer Rd.", city: "Corona", state: "NM", zip: 47094)
merchant_5 = Merchant.create(name: "Aaron Hawkins", address: "5587 Nunc. Avenue", city: "Erie", state: "RI", zip: 24975)
