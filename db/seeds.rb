# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Merchant.destroy_all

merchant_1 = Merchant.create(name: "Cecilia Chapman", address: "711-2880 Nulla St.", city: "Mankato", state: "MS", zip: 96522)
merchant_2 = Merchant.create(name: "Iris Watson", address: "8562 Fusce Rd.", city: "Frederick", state: "NB", zip: 20620)
merchant_3 = Merchant.create(name: "Calista Wise", address: "7292 Dictum Ave", city: "San Antonio", state: "MI", zip: 47096)
merchant_4 = Merchant.create(name: "Forrest Ray", address: "191-103 Integer Rd.", city: "Corona", state: "NM", zip: 47094)
merchant_5 = Merchant.create(name: "Aaron Hawkins", address: "5587 Nunc. Avenue", city: "Erie", state: "RI", zip: 24975)
