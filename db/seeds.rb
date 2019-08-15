Item.destroy_all
Merchant.destroy_all

larry_land = Merchant.create(name: "Larry Land", address: "3515 Larrold Court", city: "Derptown", state: "CO", zip: 80216)
pugtastical = Merchant.create(name: "Pugtastical", address: "3515 Puggy Court", city: "Pugville", state: "CO", zip: 80216)
pug_lyfe = Merchant.create(name: "Pug Lyfe Records", address: "123 biggie street", city: "Brooklyn", state: "ny", zip: 11205)
puggy_stuff = Merchant.create(name: "Pug Stuff", address: "3517 Ringsby Court", city: "Denver", state: "CO", zip: 80216)
larrys_bath_house = Merchant.create(name: "Larry's Bath House", address: "123 Merchant st", city: "merchantville", state: "ME", zip: 12345)

larrys_bath_house.items.create(name: "Soapy Soap", description: "a soap for dirty pugs", price: 16.0, image: "https://i.pinimg.com/originals/a9/bf/77/a9bf779477d6a97519cfe3b8c21dac90.jpg", inventory: 8)
puggy_stuff.items.create(name: "Puggo Food", description: "Dog Food", price: 20.0, image: "https://www.zooplus.co.uk/magazine/CACHE_IMAGES/768/content/uploads/2018/01/fotolia_108248133.jpg", inventory: 15)
pug_lyfe.items.create(name: "Hustle Harder", description: "a trap album", price: 20.0, image: "https://www.marathonofsport.com/images/teams/2343_lrg.jpg", inventory: 6)
pugtastical.items.create(name: "Poofy Puggo", description: "stuffed bb toy", price: 15.0, image: "https://rukminim1.flixcart.com/image/832/832/jb890nk0/stuffed-toy/k/v/q/brown-stuffed-soft-hutch-dog-or-vodafone-dog-toy-pug-dog-stuffed-original-imafymckegjjcma9.jpeg?q=70", inventory: 6)
larry_land.items.create(name: "Puggo Sausage", description: "Dog Sausages", price: 10.5, image: "https://i2.wp.com/deliciouspugshop.com/wp-content/uploads/2017/12/beef-sausage-treats-for-dogs.jpg?fit=425%2C425", inventory: 13)
larry_land.items.create(name: "Sweet Treats", description: "Dog Treats", price: 6.0, image: "https://i.pinimg.com/originals/a3/25/17/a32517db583243faca9a5b5742149297.jpg", inventory: 3)
pugtastical.items.create(name: "Leopard Leash", description: "50-inch leash", price: 50.0, image: "https://images.mattel.com/scene7/GDX05_Leopard_Leash_Set_1?$oslarge$&wid=412&hei=412", inventory: 6)
