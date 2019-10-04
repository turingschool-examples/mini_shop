# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
merchant_1 = Merchant.create( name: "Corner Store",
                              address: "234 Yarp Dr.",
                              city: "Denver",
                              state: "CO",
                              zip: "80211")
merchant_2 = Merchant.create( name: "Store Store",
                              address: "567 Narp Dr.",
                              city: "Denver",
                              state: "CO",
                              zip: "80203")
merchant_3 = Merchant.create( name: "Your More Store",
                              address: "890 Aardvark Dr.",
                              city: "Denver",
                              state: "CO",
                              zip: "80201")


batteries = Item.create( name: "Batteries",
                      description: "Bunch of loose batteries of undetermined efficacy",
                      price: 4.50,
                      image: '/assets/batteries.jpeg',
                      status: 'active',
                      inventory: 10,
                    )

blanket = Item.create( name: "Blanket",
                      description: "Soft and lightweight blanket",
                      price: 4.50,
                      image: '/assets/blanket.png',
                      status: 'inactive',
                      inventory: 4,
                    )

lightbulb = Item.create( name: "Lightbulb",
                      description: "Let there be light",
                      price: 4.50,
                      image: '/assets/lightbulb.jpg',
                      status: 'active',
                      inventory: 12,
                    )

keys = Item.create( name: "Key duplication",
                      description: "Let us create a duplicate key for you fast",
                      price: 4.50,
                      image: '/assets/keys.jpeg',
                      status: 'active',
                      inventory: 12,
                    )

pallet = Item.create( name: "Scrap Wood",
                      description: "Reduce, reuse, recycle",
                      price: 4.50,
                      image: '/assets/pallet.jpg',
                      status: 'active',
                      inventory: 12,
                    )
