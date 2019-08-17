# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Item.destroy_all
Merchant.destroy_all

corina = Merchant.create(name: 'Corina', address: '1488 S Kenton', city: 'Aurora', state: 'CO', zip: 80012)
pink = Merchant.create(name: 'PINK', address: '3000 E 1st Ave', city: 'Denver', state: 'CO', zip: 80206)
hoodie = pink.items.create(name: 'Hoodie', description: 'Black Pull Over Hoodie', price: 25, image: 'https://thenypost.files.wordpress.com/2018/03/shutterstock_450063892.jpg?quality=90&strip=all&w=618&h=410&crop=1', status: true, inventory: 11)
