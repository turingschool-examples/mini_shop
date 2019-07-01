# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Merchant.destroy_all
Item.destroy_all

merchant_1 = Merchant.create!(name: "Elmo", address: "123 Sesame Street", city: "New York", state: "New York", zip: 10023)
merchant_2 = Merchant.create!(name: "Big Bird", address: "123 Sesame Street", city: "New York", state: "New York", zip: 10023)
merchant_3 = Merchant.create!(name: "Cookie Monster", address: "123 Sesame Street", city: "New York", state: "New York", zip: 10023)
merchant_4 = Merchant.create!(name: "Oscar the Grouch", address: "123 Sesame Street", city: "New York", state: "New York", zip: 10023)
merchant_5 = Merchant.create!(name: "Bert", address: "123 Sesame Street", city: "New York", state: "New York", zip: 10023)
merchant_6 = Merchant.create!(name: "Kermit the Frog", address: "123 Sesame Street", city: "New York", state: "New York", zip: 10023)

item_1 = merchant_1.items.create!(name: "Floral Tea Cup", description: "Floral tea cup with pink and purple flowers; comes with saucer and gold spoon.", price: 20.00, image: "https://images.pexels.com/photos/355097/pexels-photo-355097.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260", active: true, inventory: 5)
item_2 = merchant_1.items.create!(name: "Glass Tea Cup", description: "Classic glass cup; perfect for those who appreciate simple elegance.", price: 10.00, image: "https://images.pexels.com/photos/905485/pexels-photo-905485.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500", active: true, inventory: 10)
item_3 = merchant_2.items.create!(name: "Teal Tea Cup", description: "Ceramic tea cup in teal; comes with saucer and silver spoon.", price: 18.00, image: "https://images.pexels.com/photos/734983/pexels-photo-734983.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500", active: true, inventory: 15)
item_4 = merchant_2.items.create!(name: "Rose Tea Cup", description: "This tea cup is made for folks who appreciate the finer things in life.", price: 22.00, image: "https://images.pexels.com/photos/56861/cup-mug-tea-bokeh-56861.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260", active: true, inventory: 20)
item_5 = merchant_3.items.create!(name: "Lime Green Tea Cup", description: "During the winter, this cup will remind you of the greenery that's missing outside your window.", price: 11.00, image: "https://images.pexels.com/photos/236699/pexels-photo-236699.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500", active: true, inventory: 25)
item_6 = merchant_3.items.create!(name: "Black Tea Pot and Cup", description: "If you want to make a bold statement, this is for you.", price: 32.00, image: "https://images.pexels.com/photos/327136/pexels-photo-327136.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260", active: true, inventory: 30)
item_7 = merchant_4.items.create!(name: "Adventure Tea Cup", description: "The words speak for itself.", price: 13.00, image: "https://images.pexels.com/photos/1625649/pexels-photo-1625649.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260", active: true, inventory: 35)
item_8 = merchant_5.items.create!(name: "Purple Floral Tea Cup", description: "This tea cup is for the well-read.", price: 8.00, image: "https://images.pexels.com/photos/1526049/pexels-photo-1526049.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260", active: true, inventory: 40)
item_9 = merchant_5.items.create!(name: "Toad Tea Cup", description: "A gift for aficionados of the Mario franchise, particularly Toad.", price: 16.00, image: "https://images.pexels.com/photos/762092/pexels-photo-762092.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500", active: true, inventory: 45)
item_10 = merchant_6.items.create!(name: "Trio of Tea Cups", description: "For those who don't drink alone.", price: 10.00, image: "https://images.pexels.com/photos/1212809/pexels-photo-1212809.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260", active: true, inventory: 50)
