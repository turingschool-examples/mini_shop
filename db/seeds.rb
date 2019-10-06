# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

merchants = Merchant.create([{ name: 'Valeo', address: '123 Main Street', city: 'Denver', state: 'CO', zip: 80218 },
                             { name: 'Spri', address: '346 Hope Ave', city: 'San Antonio', state: 'TX', zip: 78240 },
                             { name: 'Mobilitas', address: '75 Springride Meadows', city: 'Los Angeles', state: 'CA', zip: 90040}])

item_1 = merchants.first.items.create(name: 'Medicine Ball',
                                    description: 'This mb is awesome!',
                                    price: 45,
                                    image_url: 'https://i.imgur.com/pLRfskZ.jpg',
                                    active: true,
                                    inventory: 34)

item_2 = merchants[1].items.create(name: 'Kettlebell',
                                  description: 'This kb is awesome!',
                                  price: 33.40,
                                  image_url: 'https://i.imgur.com/BVEkfc7.jpg',
                                  active: true,
                                  inventory: 10)
