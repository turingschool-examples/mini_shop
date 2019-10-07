# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

rock_climbing = Merchant.create({name: "More Climb, Less Fall",
                                  address: "1234 Broadway St",
                                  city: "Denver",
                                  state: "Colorado",
                                  zip: "80203"
                                  })

mountain_biking = Merchant.create({name: "Biking, Downhill Only",
                                    address: "6848 Lincoln St",
                                    city: "Denver",
                                    state: "Colorado",
                                    zip: "80209"
                                    })

winter_sports = Merchant.create({name: "Bunny Hill Experts",
                                  address: "4567 Speer Blvd",
                                  city: "Denver",
                                  state: "Colorado",
                                  zip: "35633"
                                  })

rock_climbing.items.create!({name: "Rock Climbing Harness",
                              description: "Best harness you've never owned.",
                              price: 69.95,
                              image: "http://www.blackdiamondequipment.com/on/demandware.static/-/Sites-bdel/default/dw87c84eb3/products/harnesses/S17/P_BD651065_MomentumDSfront_web.jpg",
                              status: "active",
                              inventory: 10,
                              merchant_name: "More Climb, Less Fall"
                              })

rock_climbing.items.create!({name: "Rock Climbing Shoes",
                              description: "Glue your feet to the walls.",
                              price: 149.99,
                              image: "https://content.backcountry.com/images/items/900/MRC/MRC000E/ONECOL.jpg",
                              status: "active",
                              inventory: 4,
                              merchant_name: "More Climb, Less Fall"
                              })

rock_climbing.items.create!({name: "Climbing Rope",
                              description: "Make a sixty foot drop feel like nothing.",
                              price: 199.95,
                              image: "https://cdn.mec.ca/medias/sys_master/high-res/high-res/9022411603998/6000648-ORG19.jpg",
                              status: "active",
                              inventory: 3,
                              merchant_name: "More Climb, Less Fall"
                              })

mountain_biking.items.create!({name: "Mountain Bike",
                                description: "Smoothest ride on two wheels",
                                price: 10000.00,
                                image: "https://s3.amazonaws.com/images.gearjunkie.com/uploads/2018/04/Redpoint-Carbon-GX-Eagle-1.jpg",
                                status: "active",
                                inventory: 2,
                                merchant_name: "Biking, Downhill Only"
                                })

mountain_biking.items.create!({name: "Mountain Biking Helmet",
                                description: "Like bubble wrap protecting your nugget.",
                                price: 89.95,
                                image: "https://www.switchbacktravel.com/sites/default/files/image_fields/Best%20Of%20Gear%20Articles/Mountain%20Biking/Mountain%20Bike%20Helmets/Giro%20Switchblade%20MIPS%20mountain%20bike%20helmets.jpg",
                                status: "active",
                                inventory: 15,
                                merchant_name: "Biking, Downhill Only"
                                })

mountain_biking.items.create!({name: "Bicycle Water Bottle",
                                description: "Stay cool, stay hydrated.",
                                price: 10.99,
                                image: "https://www.statspros.com/wp-content/uploads/2018/08/Bike-Water-Bottles-250x250.jpg",
                                status: "active",
                                inventory: 30,
                                merchant_name: "Biking, Downhill Only"
                                })

winter_sports.items.create!({name: "Snowboard",
                              description: "Like a knife through butter.",
                              price: 475.85,
                              image: "https://www.lib-tech.com/media/catalog/product/cache/10f519365b01716ddb90abc57de5a837/2/0/2019-2020-lib-tech-cold-brew-snowboard.jpg",
                              status: "active",
                              inventory: 10,
                              merchant_name: "Bunny Hill Experts"
                              })

winter_sports.items.create!({name: "The OG Skis",
                              description: "The Vintage Ride.",
                              price: 699.95,
                              image: "https://skiaddict.co.uk/wp-content/uploads/2018/08/Ski-07-1024x678.jpg",
                              status: "active",
                              inventory: 1,
                              merchant_name: "Bunny Hill Experts"
                              })

winter_sports.items.create!({name: "Winter Onesie",
                              description: "Stay warm, stay stylish.",
                              price: 59.99,
                              image: "https://i.pinimg.com/originals/b3/db/5f/b3db5f3298675a022e3e4d4d7ae21d21.jpg",
                              status: "active",
                              inventory: 5,
                              merchant_name: "Bunny Hill Experts"
                              })
