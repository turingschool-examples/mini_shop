# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

merchants = Merchant.create([{name: "Puppers R Us", address: "425 Dog Day Street", city: "Denver", state: "CO", zip: 80210 },
                             {name: "Kitten Market", address: "818 Catastic Avenue", city: "Orlando", state: "FL", zip: 32810},
                             {name: "Owl City", address: "739 Hoot Boulevard", city: "New Orleans", state: "LA", zip: 70010}])
