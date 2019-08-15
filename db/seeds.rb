# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Item.destroy_all
Merchant.destroy_all

merchant_1 = Merchant.create!(name: "Football Frenzy", address: "123 14th Circle", city: "Frederick", state: "CO", zip: 80530)
merchant_2 = Merchant.create!(name: "Gridiron Gear", address: "456 East Drive", city: "Longmont", state: "CO", zip: 80501)
merchant_1.items.create!(name: "Memorabilia Helmet",
          description: "A helmet signed by Joe Montana",
          price: 249,
          image: "https://fanatics.frgimages.com/FFImage/thumb.aspx?i=/productimages/_1576000/ff_1576318_xl.jpg&w=900",
          status: "active",
          inventory: 1)
merchant_2.items.create!(name: "Football Cleats",
          description: "Size 10 football cleats",
          price: 79,
          image: "https://i.ebayimg.com/images/g/kp4AAOSw~plc2s04/s-l640.jpg",
          status: "active",
          inventory: 12)
merchant_2.items.create!(name: "Shoulder Pads",
          description: "Size large shoulder pads",
          price: 129,
          image: "https://boltathletics.com/wp-content/uploads/2016/07/Bolt-Predator-Shoulder-Pad-1.png",
          status: "inactive",
          inventory: 0)
