# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

merchant_1 = Merchant.create(name:    "Oomba",
                             address: "9840 Irvine Center Drive",
                             city:    "Irvine",
                             state:   "CA",
                             zip:     92618)
merchant_2 = Merchant.create(name:    "Kozmo",
                             address: "80 Broad Street 14th Floor",
                             city:    "New York",
                             state:   "NY",
                             zip:     10004)
